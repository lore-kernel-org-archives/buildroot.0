From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:11:52 +0200
Subject: [Buildroot] [PATCH] qemu: add ARM noMMU defconfig
In-Reply-To: <20160929105520.GA27219@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 29 Sep 2016 12:55:20 +0200")
References: <20160929105520.GA27219@waldemar-brodkorb.de>
Message-ID: <87lgxqrn6v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Useful for testing no-MMU ARM code in Qemu.
 > The newer Linux Kernels with DT support for Qemu Versatile isn't
 > yet working, so use latest 4.4 kernel.

 > Signed-off-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
 > ---
 > Only tested with serial output.
 > Anyone with Linux und Xorg can test framebuffer?

Committed, thanks.

-- 
Bye, Peter Korsgaard
