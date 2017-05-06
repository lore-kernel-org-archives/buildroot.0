From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 May 2017 11:34:45 +0200
Subject: [Buildroot] [PATCH] rpi-wifi-firmware: new package
In-Reply-To: <87k25uqqpz.fsf@dell.be.48ers.dk>
References: <20170505183741.30214-1-peter@korsgaard.com>
 <20170506082758.GD2934@scaer> <871ss2s717.fsf@dell.be.48ers.dk>
 <20170506091010.GE2934@scaer> <87k25uqqpz.fsf@dell.be.48ers.dk>
Message-ID: <20170506093445.GF2934@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-05-06 11:28 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > The OpenSUSE link you pointed above states:
> 
>  >     # From
>  >     # https://github.com/raspberrypi/linux/issues/1325#issuecomment-195560582
>  >     # Phil Elwell (Raspberry Pi Foundation) wrote: "Broadcom have said that
>  >     # the firmware files for the BCM43438 are covered under this licence:"
>  >     Source0:
>  >     https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/plain/LICENCE.broadcom_bcm43xx
> 
> Yes, the question is just if that only covers the generic .bin file or
> also the board(-family) specific nvram file, but OK.
> 
> As rpi-wifi-firmware already pulls in the .bin file from linux-firmware
> (and hence LICENSE.broadcom_bcm43xx) I'll just set _FIRMWARE_LICENSE to
> PROPRIETARY and not specify any license file here.

ACK.

>  > BTW, I love the way they force local names to be board-specific.
> 
> The # syntax?

Yep.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
