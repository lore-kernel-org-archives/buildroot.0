From: Tony Mozi <spooflinux@hotmail.fr>
Date: Tue, 2 Feb 2010 14:47:08 +0100
Subject: [Buildroot] 'make ARCH=arm' warning, how can I correct?
Message-ID: <SNT129-W159AEF2E2D689BDC2F9C82B9570@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello all,
I make the cross-compilation for an ARM.

When I make 'make ARCH=arm', I have some errors :

<stdin>:91:1: warning: "__IGNORE_sync_file_range" redefined
In file included from <stdin>:2:
include/arm/unistd.h:444:1: warning: this is the location of the previous definition
<stdin>:1097:2: warning: #warning syscall fadvise64 not implemented
<stdin>:1265:2: warning: #warning syscall migrate_pages not implemented
<stdin>:1321:2: warning: #warning syscall pselect6 not implemented
<stdin>:1325:2: warning: #warning syscall ppoll not implemented
<stdin>:1365:2: warning: #warning syscall epoll_pwait not implemented

How can I correct?

BR
 		 	   		  
_________________________________________________________________
D?couvrez Windows 7 en 7 secondes?!
http://clk.atdmt.com/FRM/go/181574577/direct/01/
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100202/bbbb7a9f/attachment.htm>
