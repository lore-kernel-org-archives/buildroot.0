From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 26 Oct 2009 19:08:40 +0100
Subject: [Buildroot] [RFC; PATCH] Use gdbserver from external toolchain
In-Reply-To: <1256406067.28475.37.camel@coalu.atr>
References: <2c9a759f0910220247u18c004epcb564aa65aa02d2b@mail.gmail.com>
	<20091024182538.69233120@surf>
	<1256406067.28475.37.camel@coalu.atr>
Message-ID: <200910261908.40389.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lionel,
All,

On Saturday 24 October 2009 19:41:07 Lionel Landwerlin wrote:
> Le samedi 24 octobre 2009 ? 18:25 +0200, Thomas Petazzoni a ?crit :
> > Can we imagine a way of making this more generic ? Maybe we could
> > detect the toolchain ?type? and act differently depending on this type ?
> What comes up to your mind by "type" ?
> Here is a short list to start with :
> 	1) uclibc vs glibc

I think Thomas was pointing to toolchains coming from different sources and
vendors:
 - crosstool-NG
 - CodeSourcery
 - OSELAS:Toolchain()
 - OpenWRT
 - manually built
 - ...

and not about what the toolchain is based upon ( and in your example, you
were missing eglibc ;-) ).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
`------------------------------^-------^------------------^--------------------'
