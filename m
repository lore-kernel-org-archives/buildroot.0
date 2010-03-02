From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Mar 2010 21:38:41 +0100
Subject: [Buildroot] uClibc-0.9.30.3-rc1
In-Reply-To: <29ad16f61003020918q282ddabfmfe2b3730783194b4@mail.gmail.com>
	(Sergey Yakoushkin's message of "Tue, 2 Mar 2010 20:18:09 +0300")
References: <20100220182228.GN30265@mx.loc> <4B8D0758.907@digi.com>
	<87mxyqvfuo.fsf@macbook.be.48ers.dk>
	<29ad16f61003020918q282ddabfmfe2b3730783194b4@mail.gmail.com>
Message-ID: <87iq9ev4q6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sergey" == Sergey Yakoushkin <sergey.yakoushkin@gmail.com> writes:

 Sergey> Hello,

 Sergey> I?m working on tool chain for embedded processor. I?m would like to
 Sergey> use uClibc and buildroot.
 Sergey> However, my tool chain is based on LLVM compiler (llvm.org).

 Sergey> I?ve adopted buildroot scripts for LLVM-GCC (C compiler with gcc
 Sergey> front-end and llvm back-end).
 Sergey> Ideally I would prefer to compile uClibc using clang (clang.llvm.org)
 Sergey> and build complete LLVM based tool chain using buildroot.

 Sergey> Are there any plans to support LLVM/clang in buildroot/uClibc?

Not that I'm aware of. If you manage to get uclibc built using llvm,
then you can probably use the external toolchain support we alredy have
in buildroot without too much trouble.

You might want to take a look at crosstool-ng for toolchain building
support/automation.

http://ymorin.is-a-geek.org/projects/crosstool

-- 
Bye, Peter Korsgaard
