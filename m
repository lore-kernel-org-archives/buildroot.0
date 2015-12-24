From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 24 Dec 2015 02:00:51 -0500
Subject: [Buildroot] official elf2flt homepage/repo updated
Message-ID: <20151224070051.GG25803@vapier.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

with the demise of the cvs repo, we've moved officially to github:
	https://github.com/uclinux-dev/elf2flt

this is based on the git mirror i had been previously maintaining here:
	git://wh0rd.org/elf2flt.git
	https://github.com/vapier/elf2flt
so if you happened to have a copy of that, you should be set to switch
over to the new location.

support will continue to use the uclinux-dev at uclinux.org mailing list.
but if people have changes they wish to merge, feel free to send pull
requests to the new location.  it even has travis build testing and a
simple (for now) testsuite.

i've cross-posted to a few lists which are all in bcc to try and keep
the resulting thread on uclinux-dev.  let's see how that goes ;).
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151224/c927be49/attachment.asc>
