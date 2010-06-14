From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 14 Jun 2010 23:06:52 +0200
Subject: [Buildroot] [PATCH 04/10] external-toolchain: support 64 bits
	glibc toolchains
In-Reply-To: <20100614225902.668e9f07@surf>
References: <cover.1276516273.git.thomas.petazzoni@free-electrons.com>
	<201006142207.30440.yann.morin.1998@anciens.enib.fr>
	<20100614225902.668e9f07@surf>
Message-ID: <201006142306.52898.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 14 June 2010 22:59:02 Thomas Petazzoni wrote:
> On Mon, 14 Jun 2010 22:07:30 +0200
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> wrote:
> > Using readelf(1) on libc.so would give us the exact name of the
> > dynamic linker ( but I'm just repeating myself here... :-) )
> That's a good idea to investigate. I'll have a look at it, but I'd
> prefer if this patch set could get merged as is, and have a look at
> this idea afterwards.

Yes, sure! You can add my:
  Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

to the 3 patches which deal with that:
  [PATCH 01/10] ext-toolchains: take into account other Glibc dynamic [...]
  [PATCH 04/10] external-toolchain: support 64 bits glibc toolchains
  [PATCH 07/10] external-toolchain: recognize uClibc 64 bits toolchains

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
