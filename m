From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Thu, 22 Jan 2009 07:11:02 +0100
Subject: [Buildroot] FOSDEM
In-Reply-To: <1232566648.11888.56.camel@elrond.atmel.com>
References: <1232566648.11888.56.camel@elrond.atmel.com>
Message-ID: <20090122071102.693fa01f@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 21 Jan 2009 20:37:28 +0100
Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:

<snipp>

> Maybe a few AVR32 Network Gateways as well. Checking if Atmel will
> sponsor...
> 

Check with the marketing people, it should be okay IMHO.

> They are a little difficult to use if you do not have
> a JTAG-ICE Mk II, which you worst case may need to reprogram U-Boot.
> If you are fine with the on-board U-boot that is of course not a
> problem.
> 

NGW100 ships with a preprogrammed U-Boot, so you do not need a JTAGICE
mkII, I seldom use my JTAG tool.

If you are unable to upgrade U-Boot by using the different tools[1] then
you can either use a binary U-Boot[2] or a binary FlashUpgrade[1][3].
For U-Boots v1.3.x and later you can self program the bootloader.

<snipp>

1: http://avr32linux.org/twiki/bin/view/Main/FlashUpgrade
2: http://www.atmel.no/buildroot/buildroot-bin.html
3: http://www.atmel.no/buildroot/buildroot-u-boot.html

-- 
Best regards,
Hans-Christian Egtvedt
