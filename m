From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Jan 2015 12:27:25 +0100
Subject: [Buildroot] [PATCH 0/5 v2] RPi: enable building a
 device-tree-enabled kernel (branch yem/rpi-dt)
In-Reply-To: <20150110122335.18905a24@free-electrons.com>
References: <cover.1420843412.git.yann.morin.1998@free.fr>
 <20150110122335.18905a24@free-electrons.com>
Message-ID: <20150110112725.GB3934@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-01-10 12:23 +0100, Thomas Petazzoni spake thusly:
> On Fri,  9 Jan 2015 23:46:19 +0100, Yann E. MORIN wrote:
> 
> > Yann E. MORIN (5):
> >       package/rpi-firmware: add DT-aware marking script
> >       package/rpi-firmware: install DTB blobs
> >       boards/raspberrypi: don't document non-existent files
> 
> Those ones applied. I just did a minor change on PATCH 2/5, to explain
> why we need to change the version when installing DTBs is enabled.

Thanks! :-)

> >       boards/raspberrypi: update readme with Device Tree instructions
> >       configs: add a DT-enabled Raspberry Pi defconfig
> 
> For those ones, I'm waiting for your input on using a custom defconfig
> instead of a default one that is too big.

In fact, that's the way I originally went for; I do have such a
minimalist defconfig, which is just bcmrpi_quick with DT enabled.

But then I thought that it would be easier to maintain usign the bundled
defconfig, even though it is much bigger.

But if you prefer, I can just restore my minimalist defconfig before I
respin.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
