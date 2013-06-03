From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 Jun 2013 00:11:12 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 yem-patchwork-fixes
In-Reply-To: <cover.1369650924.git.yann.morin.1998@free.fr>
References: <cover.1369650924.git.yann.morin.1998@free.fr>
Message-ID: <20130603221112.GC3439@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2013-05-27 12:36 +0200, Yann E. MORIN spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Hello All!
> 
> Here are four patches from Nathan Lynch to fix building out-of-tree
> when the Buildroot source tree is readonly (eg. shared via NFS between
> multiple developers).

Ping? I'm trying to check bug #5780, but can't go that far, since
target/ is readonly, which is fixed by one of these patches.

> ----------------------------------------------------------------
> Nathan Lynch (4):
>       toolchain/uClibc: ensure .oldconfig is writable
>       target: ensure target/ dir is writable
>       busybox: ensure $(BUSYBOX_BUILD_CONFIG) is writable
>       linux: ensure buildroot_defconfig is writable

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
