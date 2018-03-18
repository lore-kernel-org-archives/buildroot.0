From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Mar 2018 20:07:44 +0100
Subject: [Buildroot] [PATCH v3 0/7] Add rpi3 b+ support
In-Reply-To: <CAFGQKxcg_O2Kr-VmUhgiDW9Q_4nZY8ZsMZhLCEcpTg7SZ+un_g@mail.gmail.com>
References: <20180316180232.18829-1-martin@barkynet.com>
 <20180316204132.30aadcfc@windsurf>
 <CAFGQKxcg_O2Kr-VmUhgiDW9Q_4nZY8ZsMZhLCEcpTg7SZ+un_g@mail.gmail.com>
Message-ID: <20180318190744.GE2478@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2018-03-16 21:06 +0000, Martin Bark spake thusly:
> On 16 March 2018 at 19:41, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > Hello Martin,
> >
> > On Fri, 16 Mar 2018 18:02:25 +0000, Martin Bark wrote:
> >
> >> Martin Bark (7):
> >>   package/rpi-firmware: bump version
> >>   configs/raspberrypi*: bump kernel version
> >>   board/raspberrypi: add support for rpi3 b+
> >>   package/rpi-firmware: improve installation of dtb files
> >>   package/rpi-bt-firmware: change to LibreELEC github repo
> >>   package/rpi-wifi-firmware: change to LibreELEC github repo
> >>   DEVELOPERS: add myself for rpi packages
> >
> > Since you're looking at RPi stuff, could you have a look at
> > http://patchwork.ozlabs.org/patch/779105/, which is sitting in
> > patchwork since quite a while ?
> 
> Yes i can look at this.
> 
> The only reason for this seems to be the use of the pi3-miniuart-bt
> overlay.  Personally i never use this overlay, I set enable_uart=1 in
> config.txt (the same as raspi-config does).  Is there a reason
> buildroot favours the pi3-miniuart-bt overlay?
> 
> If we switched to using enable_uart=1 there would be no reason to
> include the overlays and no reason for this separate rpi0w defconifg.

I am all iun favour of simplifying and fixing things! Please send a
patch! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
