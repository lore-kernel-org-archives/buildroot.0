From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Apr 2021 22:38:00 +0200
Subject: [Buildroot] [PATCH v3 1/1] linux: allow firmware to be included
 in kernel
In-Reply-To: <20210424080959.GP298901@scaer>
References: <20210423185842.50143-1-sam.voss@rockwellcollins.com>
 <20210424080959.GP298901@scaer>
Message-ID: <20210425203800.GG298901@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2021-04-24 10:09 +0200, Yann E. MORIN spake thusly:
> On 2021-04-23 13:58 -0500, Sam Voss spake thusly:
> > Add functionality to use the kernel's built-in options to allow binary
> > blobs to be included with the kernel. This is equivalent to the blobs
> > existing in /lib/firmware, however are available earlier in the boot
> > process. This may be useful in situations where a device probes before
> > the rootfs is fully available (such as a squashfs not being loaded
> > before a usb device probing).
[--SNIP--]
> These two are just copies of the kernel config options. We can't
> reasonably have a Buildroot option for each of the kernel option.

After reviewing this with other maintainers, and seeing that this is
already pretty trivial to carry those options directly in the kernel's
configuration, we've concluded that we do not need to have those two
options in the Buildroot configuration.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
