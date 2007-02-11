From: Bobby Ramsook <bobby.83x2@gmail.com>
Date: Sun, 11 Feb 2007 16:35:38 -0500
Subject: [Buildroot] Problem building build root in a squashhfs image
Message-ID: <12d878080702111335j1a41b86s40e77ae1533ba075@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I Have been trying to compile buildroot, but i keep getting stuck on the
following error:

make: *** No rule to make target
`/usr/src/buildroot/build_i586/linux-2.6.12/.patched',
needed by `/usr/src/buildroot/build_i586/linux-2.6.12/.configured'.  Stop.


I looked through the build_i586 directory butr ther  was no
linux-2.6.12dir, I tried to link the
linux-headers-2.6.12 to the dir linux-2.6.12
and I get this error:


-- 
Bobby Ramsook
CCNY Computer Tech
Grad Date (EXP):  07'
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070211/dda16bf9/attachment.html 
