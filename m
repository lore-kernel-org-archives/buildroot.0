From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Jan 2013 19:48:32 +0100
Subject: [Buildroot] [PATCH 03/29] package/qemu: add basic target
	selection
In-Reply-To: <20130130093221.05bc0131@skate>
References: <cover.1359498903.git.yann.morin.1998@free.fr>
 <333827ac19a2c39c08f387b846078441478d87af.1359498903.git.yann.morin.1998@free.fr>
 <20130130093221.05bc0131@skate>
Message-ID: <201301301948.32702.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 30 January 2013 Thomas Petazzoni wrote:
> On Tue, 29 Jan 2013 23:43:47 +0100, Yann E. MORIN wrote:
> > qemu-1.2.1 requires that at least one target emulation be enabled, so
> > we use some kconfig-tricks to force at least the systems emulations to
> > be enabled if user emulation is not selected.
> > 
> > This limitation will be lifted in the upcoming qemu-1.3.x
> 
> Humm, the qemu package actually uses version 1.3.1, as per "[PATCH
> 01/29] package/qemu: bump version to 1.3.1" :-)
> 
> You also have the comment related to 1.2.x in the patch itself.

Arg. I'll fix that. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
