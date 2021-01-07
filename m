From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 7 Jan 2021 18:05:54 +0100
Subject: [Buildroot] [RFC: 1/4] package/freescale-imx/imx-gpu-viv:
 BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_{X11, WL} are libgl provider
In-Reply-To: <20210107170429.GM1485369@scaer>
References: <20210107110450.4031102-1-romain.naour@gmail.com>
 <20210107170429.GM1485369@scaer>
Message-ID: <20210107170554.GN1485369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2021-01-07 18:04 +0100, Yann E. MORIN spake thusly:
> On 2021-01-07 12:04 +0100, Romain Naour spake thusly:
> > libGL.so is installed when BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11 or BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
> > is selected, so declare it as a libgl provider.
[--SNIP--]
> I.e. isn't the solution to that issue for imx-gpu-viv to select and
> build-depend on mesa3d-headers when it needs the GL headers?

That was obviously a review for pttch 2 of the series, not patch 1.
Sorry for the confusion...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
