From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 21 Apr 2011 11:58:42 -0700
Subject: [Buildroot] creating a uclibc set of target binaries with Code
	Sourcery
Message-ID: <BANLkTin3JgVX91jeKX+YxQBap-BHMM8j1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have had good luck with Code Sourcery 2010.09 so far and have used both
config options in buildroot. The one which puts it in
output/external-toolchain and pre-installing CodeSourcery for the powerpc
and referencing it as an external tool.

Getting to the next step of understanding how to create a target uclibc
environment with a CodeSourcery pre-compiled binary would be of benefit. I
am tending towards Code Sourcery as that makes the compiler a constant
rather then a variable.

So, with that said, can I get a few hints on how one might accomplish the
mission of using an external toolchain such as CodeSourcery to compile a
uclibc root filesystem?? Can this even be done?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110421/5bdd3ea4/attachment.html>
