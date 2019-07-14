From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jul 2019 12:08:50 +0200
Subject: [Buildroot] [PATCH v4 15/15] package/gcc: enable gcc 9.1 for
 ork1 (openrisc)
In-Reply-To: <20190714120049.62a2ffa1@windsurf>
References: <20190620100725.105587-1-giulio.benetti@micronovasrl.com>
 <20190620100725.105587-16-giulio.benetti@micronovasrl.com>
 <54fe6b56-aa43-b657-0b8e-1c42e2471735@mind.be>
 <CAJF2gTQ85czGP5BAMgn5kwbJKGTmxwAakkZGmUomquTugSwMcg@mail.gmail.com>
 <20190714084056.GI2680@scaer>
 <CAJF2gTSD9ANSQs7S3nSnboZm7P012mzO1EfuE-P4Z5xFusvSYw@mail.gmail.com>
 <20190714093916.GK2680@scaer> <20190714120049.62a2ffa1@windsurf>
Message-ID: <20190714100850.GA18236@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-07-14 12:00 +0200, Thomas Petazzoni spake thusly:
> On Sun, 14 Jul 2019 11:39:16 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > This makes me wonder: should we move all this out of package/Makefile.in
> > and into the per-arch .mk files instead?
> Yes, I also thought about that when I merged Guo's patches for C-SKY.
> But other architectures already have stuff in package/Makefile.in, so
> it required a larger rework, which I didn't want to put as a
> pre-requisite to merging Guo's patches.

Exactly, it's OK that it was merged as-is.

But now that we have seen The Light, should we folow Its path and move
arch-specific stuff into arch/arch.mk.* instead?

Especially with the still-pending mini-series for ARC:
    https://patchwork.ozlabs.org/patch/1108865/
    https://patchwork.ozlabs.org/patch/1108864/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
