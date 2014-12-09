From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 00:16:01 +0100
Subject: [Buildroot] [PATCH] fs: allow to specify compression options
In-Reply-To: <1417626653-13516-1-git-send-email-vincent.stehle@freescale.com>
References: <1417626653-13516-1-git-send-email-vincent.stehle@freescale.com>
Message-ID: <20141209231601.GA4248@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vincent, All,

On 2014-12-03 18:10 +0100, Vincent Stehl? spake thusly:
> Add $BR2_TARGET_ROOTFS_xxx_OPTS options to allow changing the rootfs
> compression options.
> 
> This allows to trade compression ratio versus compression speed for example.

Thank you for your contribution!

However, we would prefer that compression option be simply removed for
all filesystems, except for squashfs and jffs2 for which compression is
intrinsic to the filesystem.

Would you mind to work on this, please?

Thank you!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
