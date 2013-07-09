From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Jul 2013 22:03:28 +0200
Subject: [Buildroot] [PATCH v2 1/2] linux: install firmware to staging.
In-Reply-To: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
References: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
Message-ID: <20130709200327.GD3543@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2013-07-09 12:39 -0500, Spenser Gilliland spake thusly:
> Install firmware to staging when the hidden option
> BR2_LINUX_KERNEL_INSTALL_FIRMWARE is selected.  This allows parts of the
> firmware provided by the linux kernel to be installed in the target.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Yann E. Morin <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Since this subject is a bit sensible, and Thomas has valid concerns about
this feature, it would be nice to hold on this until Thomas and Peter,
and others, have fully commented on this.

This is the best-so-far idea that we've discused with Spenser and Peter
on IRC, but is far from ideal. If anyone has a better idea, then do not
hesitate to speak (speak now, or be silent for the rest of Eternity! ;-) )

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
