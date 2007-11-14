From: Sean Parker <supinlick@yahoo.com>
Date: Wed, 14 Nov 2007 13:24:09 -0800 (PST)
Subject: [Buildroot] challenge finding 'root fs' generation-point in Make
	files
Message-ID: <95732.18689.qm@web51904.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello - 

  I'm having a hard time finding exactly where the file
'ramfs.img' is built. (I'm using PMC-Sierra's MIPS/Linux
dev board, which comes with buildroot/uCLinux/busybox,
etc.)

  When I build the image and tftp-it-over to the target,
the /etc/rc script dies trying to unpack and mount /var
from /ramfs.img. So I wanted to force remaking
$(TARGET_DIR)/root/ramfs.img, but I can't seem to find it's
generation (the only ref I find is in a Makefile.in in a
subdir specifically building PMC-Sierra
extensions/patches/rootfs files) and I suppose it's a
generic function that you folks might know of...

  Does anyone know where in the Make tree this is built so
I can prove to myself the make is hitting that place, and
try to find where I may be clobbering the file later in the
build?

  Any help appreciated - thanks
    Sean





God Bless 
    Sean Parker 





      ____________________________________________________________________________________
Get easy, one-click access to your favorites. 
Make Yahoo! your homepage.
http://www.yahoo.com/r/hs 
