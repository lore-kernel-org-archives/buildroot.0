From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 27 Nov 2007 09:14:39 +0100
Subject: [Buildroot] Curl package cannot be downloaded
In-Reply-To: <47138C69.1010400@mowsey.org>
References: <47138C69.1010400@mowsey.org>
Message-ID: <1196151279.15682.64.camel@elrond.atmel.sweden>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

m?n 2007-10-15 klockan 11:51 -0400 skrev Jack Schmidt:
> Howdy, I tried using buildroot to make an image with some fancier 
> applications like curl and xsltproc, but ran into trouble.  The curl 
> trouble seems pretty clearcut (the libxml2 stuff is some path problem).

> The curl package tries to download a fairly old version of curl and that 
> version is no longer at the download page.  Much newer versions are 
> available, and I think they fix some of the security problems patched 
> manually.  However, some manual patches seem to still be needed, but do 
> not apply cleanly.
> 
Version bumped to 1.17.1 inlatest svn.
Builds cleanly vs ARM.
Did not attempt to fix any patches though.

> I wasn't sure exactly which way to help: find an alternate source of 
> ancient curl, find the oldest curl available at the official source, or 
> update the patches for the latest curl.
> 
> 
> In general, should I expect the packages to "just work" or should I 
> expect buildroot to give me hints at building, and do a lot of the build 
> myself?
> 
> I don't want to report bugs in 20 packages, if these are the minor sorts 
> of issues we are expected to work out.  Last time I tried buildroot, 
> virtually everything but the core was broken, but the core worked 
> amazingly great and any package I wanted to use was just ./configure && 
> make && make install.
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
-- 
Best Regards
Ulf Samuelsson
