From: Sander in 't Hout <sander.ashwin@live.nl>
Date: Wed, 30 Jun 2010 15:21:28 +0200
Subject: [Buildroot] buildroot toolchain builds segfaulting statically
	linked executables
Message-ID: <BLU145-W29B69E6C0D143996626CC9EBCC0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello all,
I'm trying to build a statically linked busybox, but when I run it on the target machine, it immediately segfaults.I use buildroot version 2010.05, my target is i586. I also tried buildroot's default settings and the latest git revision.
It happens with every statically linked executables (udev, sysvinit). Dynamically linked executables run just fine.
My host is Fedora 13 x64.
Does anyone have an idea why statically linked executables segfault?
Thanks,Sander in 't Hout 		 	   		  
_________________________________________________________________
Een netbook met Windows 7? Hier vind je alles dat je moet weten.
http://www.windows.nl/netbook
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100630/df147574/attachment.html>
