From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 26 Oct 2009 19:12:45 +0100
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <20091024182538.69233120@surf>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
	<20091024182538.69233120@surf>
Message-ID: <200910261912.45928.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all!

On Saturday 24 October 2009 18:25:38 Thomas Petazzoni wrote:
> Le Thu, 22 Oct 2009 11:47:52 +0200,
> Anders Darander <anders.darander@gmail.com> a ?crit :
> > I've attached a patch (formatted by git), which adds the possibility
> > to have buildroot install the already compiled gdbserver from an
> > external toolchain.
> This feature is of course very welcome, but I'd like to see the
> external toolchain support to be extended to toolchains not generated
> by Crosstool-NG (Codesourcery toolchains, for example, are still on my
> TODO-list).

Yes, the idea is nice, and having a generic way to get such info is
most wanted. Unfortunately, I'm afraid that most toolchains will not
provide such means (of course we can try to push it, and it will be
easier for some than for others).

> Can we imagine a way of making this more generic ? Maybe we could
> detect the toolchain ?type? and act differently depending on this
> type ? 

Hmmm... That would require quite some knowledge about the toolchain
generators, and each may change paths as they see fit, and we'd be
lagging behind very quickly...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
