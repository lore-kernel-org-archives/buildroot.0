From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 1 Feb 2016 22:36:11 +0100
Subject: [Buildroot] [PATCH 3/4] kernel-module-imx-gpu-viv: add new
	package
In-Reply-To: <87powg9l3e.fsf@dell.be.48ers.dk>
References: <1454319423-13913-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454319423-13913-4-git-send-email-gary.bisson@boundarydevices.com>
 <20160201215644.1e3d3713@free-electrons.com>
 <87powg9l3e.fsf@dell.be.48ers.dk>
Message-ID: <20160201213611.GG4278@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gary, All,

On 2016-02-01 22:28 +0100, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>  > I really don't like spreading hooks for package A in the code of
>  > package B. I think here it's better to change linux.mk with:
>  >         $(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
>  >                 $(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
>  > In LINUX_KCONFIG_FIXUP_CMDS.
>  > Peter, Arnout, Yann, what do you think ?
> Yes, that matches what we do for the other package related kernel
> configs.

Agreed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
