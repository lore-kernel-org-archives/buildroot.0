From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 19:31:06 +0100
Subject: [Buildroot] [PATCH] Raspberry Pi 2 Support
In-Reply-To: <1424322894-27643-1-git-send-email-g@maral.me>
References: <1424282540-6127-1-git-send-email-g@maral.me>
 <1424322894-27643-1-git-send-email-g@maral.me>
Message-ID: <20150222183106.GD4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillermo, All,

On 2015-02-18 21:14 -0800, Guillermo A. Amaral spake thusly:
> Added support for Raspberry Pi 2, tried to keep the configuration
> similar to the current RPi support.

We already have pending patches to add support for the RPi-2:
    http://patchwork.ozlabs.org/patch/439448/
    http://patchwork.ozlabs.org/patch/439668/

I think those are better than yours, because they properly split bumping
the rpi-firmware version from adding a RPi-2 defconfig.

So, I've marked yours as "Not Applicable" in our patchwork.

Thank you! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
