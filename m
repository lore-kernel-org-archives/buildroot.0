From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Oct 2013 00:19:27 +0200
Subject: [Buildroot] [PATCH 8/9] package/weston: add RPi compositor
In-Reply-To: <5f7eec067dd2386563d55353426a080f7094f0dd.1381354867.git.yann.morin.1998@free.fr>
References: <cover.1381354867.git.yann.morin.1998@free.fr>
 <5f7eec067dd2386563d55353426a080f7094f0dd.1381354867.git.yann.morin.1998@free.fr>
Message-ID: <20131009221927.GC3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2013-10-09 23:44 +0200, Yann E. MORIN spake thusly:
[--SNIP--]
> +config BR2_PACKAGE_WESTON_RPI
> +	bool "RPi compositor"
> +	depends on BR2_arm                  # rpi-userland
> +	depends on BR2_INSTALL_LIBSTDCPP    # rpi-userland
> +	depends on BR2_LARGEFILE            # rpi-userland

Missing "depends on THREADS" due to rpi-userland.
I've just sent an updated patch. Sorry for the confusion... :-(

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
