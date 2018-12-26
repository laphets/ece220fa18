//									tab:8
//
// mp12.cpp - source file for Spring 2018 MP12 student code
//
// "Copyright (c) 2018 by Steven S. Lumetta."
//
// Permission to use, copy, modify, and distribute this software and its
// documentation for any purpose, without fee, and without written agreement is
// hereby granted, provided that the above copyright notice and the following
// two paragraphs appear in all copies of this software.
// 
// IN NO EVENT SHALL THE AUTHOR OR THE UNIVERSITY OF ILLINOIS BE LIABLE TO 
// ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL 
// DAMAGES ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, 
// EVEN IF THE AUTHOR AND/OR THE UNIVERSITY OF ILLINOIS HAS BEEN ADVISED 
// OF THE POSSIBILITY OF SUCH DAMAGE.
// 
// THE AUTHOR AND THE UNIVERSITY OF ILLINOIS SPECIFICALLY DISCLAIM ANY 
// WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE 
// PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND NEITHER THE AUTHOR NOR
// THE UNIVERSITY OF ILLINOIS HAS ANY OBLIGATION TO PROVIDE MAINTENANCE, 
// SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS."
//
// Author:	    Steve Lumetta
// Version:	    1.00
// Creation Date:   20 April 2018
// Filename:	    mp12.cpp
// History:
//	SL	1.00	20 April 2018
//		First written.
//

#include <iostream>
#include <list>

#include <math.h>
#include <stdio.h>

#include "WALYmain.h"

#include "TurtleScreen.h"

#include "mp5.h"
#include "mp12.h"

using namespace std;
using namespace WALY;

// THESE ARE GLOBAL VARIABLES IN THE INTEREST OF TESTING.  THEY SHOULD
// BE FILE-SCOPE OR LOCAL TO frameUpdate.
FILE*           input = NULL;		// input stream
list<segment_t> lines;			// list of lines drawn
command_t       cmd = {CMD_NONE};	// current command
int32_t	        moveColor = 0xFFFFFF;	// current movement drawing color

int32_t
openInputStream (const char* fname)
{
    return 0;
}

void
closeInputStream (void)
{
}

void
showLines (void)
{
    // you can use 'call showLines ()' in GDB to look at the
    // list of segments.  Don't forget to call makeVisibleChange
    // when you change this list, since the background won't be
    // redrawn unless you call that function (so changes will not
    // show up.
    for (list<segment_t>::iterator it = lines.begin ();
	 lines.end () != it; it++) {
Screen::debug () << it->color << " " << it->x1 << "," << it->y1 << "  " << it->x2 << "," << it->y2 << endl;
    }
}

void
drawEverything (void)
{
}

void
readNewCommand (TurtleScreen* ts)
{
}

void
frameUpdate (TurtleScreen* ts)
{
}

