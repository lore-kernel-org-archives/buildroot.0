From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Apr 2021 21:43:29 +0200
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: bump to version
 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c
In-Reply-To: <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
References: <20210426101021.2418145-1-romain.naour@gmail.com>
 <20210426101021.2418145-2-romain.naour@gmail.com>
 <e539cd7b-3775-024e-1f9f-67658e38a10b@mind.be>
Message-ID: <20210426194329.GL298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Romain, All,

On 2021-04-26 21:36 +0200, Arnout Vandecappelle spake thusly:
> On 26/04/2021 12:10, Romain Naour wrote:
> [snip]
> >  rename package/glibc/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/glibc.hash (70%)
> >  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0001-HACK-only-build-and-install-localedef.patch (100%)
> >  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
> >  rename package/localedef/{2.32-37-g760e1d287825fa91d4d5a0cc921340c740d803e2 => 2.33-37-g162df872f0dfc2b124a18e1a8c33be63f70d9a1c}/localedef.hash (70%)
> 
>  Now you're messing with these packages, maybe you can take the opportunity to
> get rid of the versioned subdirectory. That's a leftover from when we had
> version selection for glibc.

We stil have a version choice for glibc; it's just not exposed to the
user: indeed we use different version for csky, riscv32, and the rest.

So, we still do not want to apply the "generic" patches to the csky
fork, or to the riscv32 version...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
