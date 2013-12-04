From: Brian Beattie <beattie@beattie-home.net>
Date: Tue, 03 Dec 2013 20:02:45 -0800
Subject: [Buildroot] pcduino
Message-ID: <1386129765.18658.57.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm working on adding support for the pcDuino V1 board, this is an
Allwinner A10 based board so I'm using the cubieboard as a staring
point.  The issue I have is that or U-Boot and the kernel this is not a
problem, however for sunxi-boards and sunxi-tools, the commit id is in
the Makefile.  I'd like to know what the experts think the best approach
is.  I currently have the Makefiles patched.

I could update the Makefiles, but I don't have a cubieboard to test
with.

I could modify the *.mk and Config files to make the commit id a
configurable item and if not set use the current commit ID.  I started
to do this, but sunxi-tools has a Config.in and a Config.in.host and I'm
not sure how to handle setting one variable that would be used in both
files.  Suggestions, pointers welcome.

Some other approach I have not thought of.

BTW I did the original KB9202 support many years ago though I have been
away for a while. (that board just bit the dust which is why I bought
the pcDuino).
-- 
"For every complex problem there is an answer that is clear, simple, and
wrong." -- H. L. Mencken

Brian Beattie<beattie@beattie-home.net> -- www.brian-beattie.com
LFS12947
