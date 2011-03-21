From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Mon, 21 Mar 2011 15:27:13 -0500
Subject: [Buildroot] External ToolChain, what if. . .
Message-ID: <9AC3F0E75060224C8BBC5BA2DDC8853A1F914A59@EXV1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have a situation in which I want to be able to install the libs that
get generated in buildroot back into the real sysroot of the toolchain.

What is the "real" way of doing this?  Currently, I'm attempting to
patch the package/Makefile.in to point STAGING_DIR to the sysroot of
my external toolchain such that I install all libs into that location
for use later.

Thanks in advance,
Andy
