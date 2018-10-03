From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 3 Oct 2018 11:26:53 +0100
Subject: [Buildroot] Custom C Libraries for RISC-V 32-bit Support
Message-ID: <37c3dc75-0145-ce92-05c0-6c9559b86022@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I've been asked by a few people about adding RISC-V 32-bit support to
Buildroot.

This would require the ability to select custom git repositories for C
libraries. There is a glibc repository based on v2.26 that works for
riscv32 and there is also a musl repository for riscv32/riscv64 that I'd
like to test.

I'm happy to add support for custom C libraries, but was wondering what
everybody's thoughts were on this?

Thanks

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
