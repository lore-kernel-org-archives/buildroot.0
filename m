From: Sergey Yakoushkin <sergey.yakoushkin@gmail.com>
Date: Wed, 3 Mar 2010 06:34:02 +0300
Subject: [Buildroot] uClibc-0.9.30.3-rc1
In-Reply-To: <87iq9ev4q6.fsf@macbook.be.48ers.dk>
References: <20100220182228.GN30265@mx.loc> <4B8D0758.907@digi.com>
	<87mxyqvfuo.fsf@macbook.be.48ers.dk>
	<29ad16f61003020918q282ddabfmfe2b3730783194b4@mail.gmail.com>
	<87iq9ev4q6.fsf@macbook.be.48ers.dk>
Message-ID: <29ad16f61003021934x7530b248n3f1162db0642d6b6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, Peter

Sergey> Are there any plans to support LLVM/clang in buildroot/uClibc?

> Not that I'm aware of. If you manage to get uclibc built using llvm,
> then you can probably use the external toolchain support we alredy have
> in buildroot without too much trouble.
Actually, I've was able to extend BuildRoot to support LLVM and
LLVM-GCC natively (not as external).
Now I'm wondering if it is possible to built uClibc with Clang? Have
anyone tried?

> You might want to take a look at crosstool-ng for toolchain building support/automation.
Thanks for interesting link.

Regards,
Sergey Yakoushkin
