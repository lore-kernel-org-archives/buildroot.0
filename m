From: Sergey Yakoushkin <sergey.yakoushkin@gmail.com>
Date: Tue, 2 Mar 2010 20:18:09 +0300
Subject: [Buildroot] uClibc-0.9.30.3-rc1
In-Reply-To: <87mxyqvfuo.fsf@macbook.be.48ers.dk>
References: <20100220182228.GN30265@mx.loc> <4B8D0758.907@digi.com>
	<87mxyqvfuo.fsf@macbook.be.48ers.dk>
Message-ID: <29ad16f61003020918q282ddabfmfe2b3730783194b4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I?m working on tool chain for embedded processor. I?m would like to
use uClibc and buildroot.
However, my tool chain is based on LLVM compiler (llvm.org).

I?ve adopted buildroot scripts for LLVM-GCC (C compiler with gcc
front-end and llvm back-end).
Ideally I would prefer to compile uClibc using clang (clang.llvm.org)
and build complete LLVM based tool chain using buildroot.

Are there any plans to support LLVM/clang in buildroot/uClibc?

Regards,
Sergey Yakoushkin
