// PLACEHOLDER!

// COPY YOUR SOLUTION TO MP5 OVER THIS FILE

#include <stdio.h>

#include "mp5.h"

/**
 * This program is used to draw various lines or shapes by the combination of
 * simple functions(draw dot and set color). Also, for the function draw_picture,
 * I draw a logo of "Docker", which consists two circle and some rectangle.
 */


/**
 * This function is used to swap value of two variable
 * @param a
 * @param b
 */
void swap(int32_t* a, int32_t* b) {
    int32_t tmp = *b;
    *b = *a;
    *a = tmp;
}

/**
 * This function is to get the min number of a and b
 * @param a
 * @param b
 * @return
 */
int32_t get_min(int32_t a, int32_t b) {
    return a < b ? a: b;
}

/**
 * This function is used to get the maximum of a and b
 * @param a
 * @param b
 * @return
 */
int32_t get_max(int32_t a, int32_t b) {
    return a > b ? a: b;
}
/*
 *  near_horizontal
 *
 *
 *
 *
 * INPUTS: x_start,y_start -- the coordinates of the pixel at one end of the line
 * 	   x_end, y_end    -- the coordinates of the pixel at the other end
 * OUTPUTS: draws a pixel to all points in between the two given pixels including
 *          the end points
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
near_horizontal(int32_t x_start, int32_t y_start, int32_t x_end, int32_t y_end){
    /* Your code goes here! */
    int32_t x1 = 0, x2 = 0, y1 = 0, y2 = 0;
    int32_t res = 1;
    // To make (x1, y1) be the left one
    if(x_start < x_end) {
        x1 = x_start;
        y1 = y_start;
        x2 = x_end;
        y2 = y_end;
    } else {
        x1 = x_end;
        y1 = y_end;
        x2 = x_start;
        y2 = y_start;
    }
    if(x1 == x2 && y1 == y2) {
        // Same point
        res &= draw_dot(x1, y1);
        return res;
    }
    // Draw pixel dots
    for (int32_t x = x1; x <= x2; x++) {
        int32_t y = ((2*(y2-y1)*(x-x1)+(x2-x1))/(2*(x2-x1))) + y1;
        res &= draw_dot(x, y);
    }
    return res;
}


/*
 *  near_vertical
 *
 *
 *
 *
 * INPUTS: x_start,y_start -- the coordinates of the pixel at one end of the line
 * 	   x_end, y_end    -- the coordinates of the pixel at the other end
 * OUTPUTS: draws a pixel to all points in between the two given pixels including
 *          the end points
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
near_vertical(int32_t x_start, int32_t y_start, int32_t x_end, int32_t y_end){
    /* Your code goes here! */
    int32_t x1 = 0, x2 = 0, y1 = 0, y2 = 0;
    int32_t res = 1;
    // To make (x1, y1) the upper one
    if(y_start < y_end) {
        y1 = y_start;
        x1 = x_start;
        y2 = y_end;
        x2 = x_end;
    } else {
        y1 = y_end;
        x1 = x_end;
        y2 = y_start;
        x2 = x_start;
    }
    // Draw pixel dots
    for(int32_t y = y1; y <= y2; y++) {
        int32_t x = ((2*(x2-x1)*(y-y1)+(y2-y1))/(2*(y2-y1))) + x1;
        res &= draw_dot(x, y);
    }
    return res;
}

/*
 *  draw_line
 *
 *
 *
 *
 * INPUTS: x_start,y_start -- the coordinates of the pixel at one end of the line
 * 	   x_end, y_end    -- the coordinates of the pixel at the other end
 * OUTPUTS: draws a pixel to all points in between the two given pixels including
 *          the end points
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
draw_line(int32_t x_start, int32_t y_start, int32_t x_end, int32_t y_end){
    /* Your code goes here! */
    int32_t dx = x_end - x_start;
    int32_t dy = y_end - y_start;
    if(dx == 0 && dy == 0) {
        // They are same point
        return near_horizontal(x_start, y_start, x_end, y_end);
    }
    if(dx == 0) {
        // Vertical
        return near_vertical(x_start, y_start, x_end, y_end);
    }
    if(dx < 0) {
        // Make (dy / dx) ?= 1
        // So if dx < 0, then make both denominator and numerator inverse
        dx = -dx;
        dy = -dy;
    }
    if (dy <= dx && dy >= -dx) {
        // -1<=slope<=1, horizontal
        return near_horizontal(x_start, y_start, x_end, y_end);
    } else {
        // slope<-1 or slope>1, vertical
        return near_vertical(x_start, y_start, x_end, y_end);
    }
}


/*
 *  draw_rect
 *
 *
 *
 *
 * INPUTS: x,y -- the coordinates of the of the top-left pixel of the rectangle
 *         w,h -- the width and height, respectively, of the rectangle
 * OUTPUTS: draws a pixel to every point of the edges of the rectangle
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
draw_rect(int32_t x, int32_t y, int32_t w, int32_t h){
    /* Your code goes here! */
    if (w < 0 || h < 0) {
        // If height < 0 or width < 0
        return 0;
    }
    // Draw 4 lines of 4 corners
    int32_t res = 1;
    res &= draw_line(x, y, x+w, y);
    res &= draw_line(x+w, y, x+w, y+h);
    res &= draw_line(x+w, y+h, x, y+h);
    res &= draw_line(x, y+h, x, y);

    return res;
}


/*
 *  draw_triangle
 *
 *
 *
 *
 * INPUTS: x_A,y_A -- the coordinates of one of the vertices of the triangle
 *         x_B,y_B -- the coordinates of another of the vertices of the triangle
 *         x_C,y_C -- the coordinates of the final of the vertices of the triangle
 * OUTPUTS: draws a pixel to every point of the edges of the triangle
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
draw_triangle(int32_t x_A, int32_t y_A, int32_t x_B, int32_t y_B, int32_t x_C, int32_t y_C){
    /* Your code goes here! */
    int32_t res = 1;
    res &= draw_line(x_A, y_A, x_B, y_B);
    res &= draw_line(x_B, y_B, x_C, y_C);
    res &= draw_line(x_C, y_C, x_A, y_A);
    return res;
}

/*
 *  draw_parallelogram
 *
 *
 *
 *
 * INPUTS: x_A,y_A -- the coordinates of one of the vertices of the parallelogram
 *         x_B,y_B -- the coordinates of another of the vertices of the parallelogram
 *         x_C,y_C -- the coordinates of another of the vertices of the parallelogram
 * OUTPUTS: draws a pixel to every point of the edges of the parallelogram
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
draw_parallelogram(int32_t x_A, int32_t y_A, int32_t x_B, int32_t y_B, int32_t x_C, int32_t y_C){
    /* Your code goes here! */
    // Solve for position of D
    int32_t dx = x_C - x_B;
    int32_t dy = y_C - y_B;
    int32_t x_D = x_A + dx;
    int32_t y_D = y_A + dy;

    // Draw lines for 4 corners
    int32_t res = 1;
    res &= draw_line(x_A, y_A, x_B, y_B);
    res &= draw_line(x_B, y_B, x_C, y_C);
    res &= draw_line(x_C, y_C, x_D, y_D);
    res &= draw_line(x_D, y_D, x_A, y_A);
    return res;
}


/*
 *  draw_circle
 *
 *
 *
 *
 * INPUTS: x,y -- the center of the circle
 *         inner_r,outer_r -- the inner and outer radius of the circle
 * OUTPUTS: draws a pixel to every point whose distance from the center is
 * 	    greater than or equal to inner_r and less than or equal to outer_r
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
draw_circle(int32_t x, int32_t y, int32_t inner_r, int32_t outer_r){
    /* Your code goes here!*/
    if(inner_r < 0) {
        return 0;
    }
    if(outer_r < inner_r) {
        return 0;
    }

    // Get the border of x and y
    int32_t x1 = x - outer_r, x2 = x + outer_r;
    int32_t y1 = y - outer_r, y2 = y + outer_r;

    int32_t inner_r2 = inner_r * inner_r;
    int32_t outer_r2 = outer_r * outer_r;

    int32_t res = 1;
    // Loop for x and y, and check whether it's in the circle
    for(int32_t xp = x1; xp <= x2; xp++) {
        for(int32_t yp = y1; yp <= y2; yp++) {
            int32_t real_distance2 = (xp-x)*(xp-x) + (yp-y)*(yp-y);
            if(real_distance2 <= outer_r2 && real_distance2 >= inner_r2) {
                // In the bounding
                res &= draw_dot(xp, yp);
            }
        }
    }

    return res;
}


/*
 *  rect_gradient
 *
 *
 *
 *
 * INPUTS: x,y -- the coordinates of the of the top-left pixel of the rectangle
 *         w,h -- the width and height, respectively, of the rectangle
 *         start_color -- the color of the far left side of the rectangle
 *         end_color -- the color of the far right side of the rectangle
 * OUTPUTS: fills every pixel within the bounds of the rectangle with a color
 *	    based on its position within the rectangle and the difference in
 *          color between start_color and end_color
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */
/**
 * This function is used to get R value of a full color
 * @param color
 * @return
 */
int32_t get_r_color(int32_t color) {
    return ((color&(0x00FF0000))>>16);
}

/**
 * This function is used to get G value of a full color
 * @param color
 * @return
 */
int32_t get_g_color(int32_t color) {
    return ((color&(0x0000FF00))>>8);
}

/**
 * This function is used to get B value of a full color
 * @param color
 * @return
 */
int32_t get_b_color(int32_t color) {
    return (color&(0x000000FF));
}

/**
 * This function is used to generate a full color by (r, g, b)
 * @param r
 * @param g
 * @param b
 * @return
 */
int32_t form_new_color(int32_t r, int32_t g, int32_t b) {
    int32_t color = 0;
    color += r;
    color <<= 8;
    color += g;
    color <<= 8;
    color += b;
    return color;
}

/**
 * This function is used to draw a rectangular with gradient color from start_color to end_color.
 * @param x
 * @param y
 * @param w
 * @param h
 * @param start_color
 * @param end_color
 * @return
 */
int32_t
rect_gradient(int32_t x, int32_t y, int32_t w, int32_t h, int32_t start_color, int32_t end_color){
    /* Your code goes here! */
    if(w < 0 || h < 0) {
        return 0;
    }

    int32_t res = 1;

    int32_t x1 = x, x2 = x+w;
    int32_t level2_r = get_r_color(end_color), level1_r = get_r_color(start_color);
    int32_t level2_g = get_g_color(end_color), level1_g = get_g_color(start_color);
    int32_t level2_b = get_b_color(end_color), level1_b = get_b_color(start_color);

    for(int32_t xp = x; xp <= x+w; xp++) {
        for(int32_t yp = y; yp <= y+h; yp++) {
            int32_t level_r = ((2*(xp - x1)*(level2_r - level1_r) + (x2 - x1))/(2*(x2-x1))) + level1_r;
            int32_t level_g = ((2*(xp - x1)*(level2_g - level1_g) + (x2 - x1))/(2*(x2-x1))) + level1_g;
            int32_t level_b = ((2*(xp - x1)*(level2_b - level1_b) + (x2 - x1))/(2*(x2-x1))) + level1_b;
            set_color(form_new_color(level_r, level_g, level_b));
            res &= draw_dot(xp, yp);
        }
    }

    return res;
}


/*
 *  draw_picture
 *	I draw a logo of "Docker" here
 * INPUTS: none
 * OUTPUTS: alters the image by calling any of the other functions in the file
 * RETURN VALUE: 0 if any of the pixels drawn are out of bounds, otherwise 1
 * SIDE EFFECTS: none
 */

int32_t
draw_half_circle(int32_t x, int32_t y, int32_t inner_r, int32_t outer_r, int32_t position, int32_t color){
    /* Your code goes here!*/
    if(inner_r < 0) {
        return 0;
    }
    if(outer_r < inner_r) {
        return 0;
    }

    int32_t x1 = 0, x2 = 0;
    if(position == 1) {
        // Right
        x1 = x;
        x2 = x + outer_r;
    } else if (position == 2) {
        // Left
        x1 = x - outer_r;
        x2 = x;
    } else {
        x1 = x - outer_r;
        x2 = x + outer_r;
    }
    set_color(color);
    int32_t y1 = y - outer_r, y2 = y + outer_r;

    int32_t inner_r2 = inner_r * inner_r;
    int32_t outer_r2 = outer_r * outer_r;

    int32_t res = 1;

    for(int32_t xp = x1; xp <= x2; xp++) {
        for(int32_t yp = y1; yp <= y2; yp++) {
            int32_t real_distance2 = (xp-x)*(xp-x) + (yp-y)*(yp-y);
            if(real_distance2 <= outer_r2 && real_distance2 >= inner_r2) {
                // In the bounding
                res &= draw_dot(xp, yp);
            }
        }
    }

    return res;
}

/**
 * This function is to draw halp circle
 * @param x
 * @param y
 * @param inner_r
 * @param outer_r
 * @param position left or right
 * @param color
 * @return
 */
int32_t
draw_half_circle_bound(int32_t x, int32_t y, int32_t inner_r, int32_t outer_r, int32_t position, int32_t color){
    /* Your code goes here!*/
    if(inner_r < 0) {
        return 0;
    }
    if(outer_r < inner_r) {
        return 0;
    }

//    int32_t x1 = 0, x2 = 0;
//    if(position == 1) {
//        // Right
//        x1 = x;
//        x2 = x + outer_r;
//    } else if (position == 2) {
//        // Left
//        x1 = x - outer_r;
//        x2 = x;
//    } else {
//        x1 = x - outer_r;
//        x2 = x + outer_r;
//    }
    set_color(color);
    int32_t y1 = y, y2 = y + outer_r;

    int32_t inner_r2 = inner_r * inner_r;
    int32_t outer_r2 = outer_r * outer_r;

    int32_t res = 1;

    for(int32_t xp = 200; xp <= 245; xp++) {
        for(int32_t yp = y1; yp <= y2; yp++) {
            int32_t real_distance2 = (xp-x)*(xp-x) + (yp-y)*(yp-y);
            if(real_distance2 <= outer_r2 && real_distance2 >= inner_r2) {
                // In the bounding
                res &= draw_dot(xp, yp);
            }
        }
    }

    return res;
}

/**
 * This function is used to draw my own picture
 * @return
 */
int32_t
draw_picture(){
    /* Your code goes here! */
    int32_t res = 1;
    set_color(0);
    res &= draw_half_circle(275, 172, 0, 130, 2, 0x000288d1);
    res &= draw_half_circle(275, 117, 0, 185, 1, 0x000288d1);
    set_color(0X00ffffff);
    res &= rect_gradient(0, 0, 624 ,172, 0X00ffffff, 0X00ffffff);

    res &= rect_gradient(147, 170, 305 ,26, 0X0004a9f5, 0X0004a9f5);

    res &= rect_gradient(148, 190, 340 ,8, 0X00354750, 0X00354750);

    res &= draw_half_circle(265,233, 0, 15, 0, 0x00ffffff);
    res &= draw_half_circle(265,233, 0, 7, 0, 0x00000000);


    res &= draw_half_circle(245,258, 0, 6, 1, 0x00000000);

    res &= draw_half_circle_bound(180, 160, 112, 123, 0, 0x00000000);

    res &= rect_gradient(182, 134, 35, 35, 0x0000579c, 0x0000579c);
    res &= rect_gradient(182 + 35, 134, 35, 35, 0x000288d1, 0x000288d1);
    res &= rect_gradient(182 + 70, 134, 35, 35, 0x0000579c, 0x0000579c);
    res &= rect_gradient(182 + 105, 134, 35, 35, 0x000288d1, 0x000288d1);
    res &= rect_gradient(182 + 140, 134, 35, 35, 0x0000579c, 0x0000579c);


//    rect_gradient(182, 134, 35, 35, 0x0000579c, 0x0000579c);
    res &= rect_gradient(182 + 35, 134 - 35, 35, 35, 0x0000579c, 0x0000579c);
    res &= rect_gradient(182 + 70, 134 - 35, 35, 35, 0x000288d1, 0x000288d1);
    res &= rect_gradient(182 + 105, 134 - 35, 35, 35, 0x0000579c, 0x0000579c);

    res &= rect_gradient(182 + 105, 134 - 70, 35, 35, 0x000288d1, 0x000288d1);

    return res;
}
