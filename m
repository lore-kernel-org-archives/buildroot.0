From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 22:26:30 +0200
Subject: [Buildroot] [pull request] raspberrypi: update packages and
 defconfigs
In-Reply-To: <20150629222236.394f9932@free-electrons.com>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
 <20150629222236.394f9932@free-electrons.com>
Message-ID: <20150629202630.GE3669@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-06-29 22:22 +0200, Thomas Petazzoni spake thusly:
> On Mon, 29 Jun 2015 00:25:14 +0200, Yann E. MORIN wrote:
> >       package/rpi-firmware: add option to install vcdbg
> Marked as Changes Requested, see my comments.

OK, will use a select.

> >       configs/raspberrypi: update the DT-enabled config
> >       configs/raspberrypi_plus: new defconfig
> >       configs/raspberrypi2: update our defconfig
> >       config/raspberrypi: remove non-DT defconfig
> >       config/raspberrypi: rename our defconfig files
> >       boards/raspberrypi: update instructions
> 
> Marked as Changes Requested: I'd like to have a single defconfig for
> RPi A/B and RPi A+/B+ by simply building two DTBs.
> 
> Can you respin the patches 3 and 6-11 ?

Yup, already on it! :-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
