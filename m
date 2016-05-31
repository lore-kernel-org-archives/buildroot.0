From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 31 May 2016 17:41:07 +0200
Subject: [Buildroot] [PATCH] libsigsegv: disable for sparc and uClibc
	toolchain
In-Reply-To: <20160528183300.GA32037@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Sat, 28 May 2016 20:33:00 +0200")
References: <20160528183300.GA32037@waldemar-brodkorb.de>
Message-ID: <87shwyxmjw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > The context function support is not available for uClibc and
 > sparc. It will be introduced in uClibc-ng 1.0.15, and
 > then the patch can be reverted.

 > Fixes following autobuild failures:
 > http://autobuild.buildroot.net/results/f1aa74992a77da325b3c6d74f9f88624bad094e9/
 > http://autobuild.buildroot.net/results/69bf0dbb0be3d4e4783ee332b3e95ca31f18d3bf/
 > http://autobuild.buildroot.net/results/f5bc9921c1b9f839e5536c19348efebd6826123d/

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
