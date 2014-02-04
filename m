From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 04 Feb 2014 10:06:13 +0100
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
 (ludovic desroches's message of "Thu, 30 Jan 2014 15:55:26 +0100")
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <87y51rl01m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>>   <ludovic.desroches@atmel.com> writes:

 > From: Ludovic Desroches <ludovic.desroches@atmel.com>
 > Defconfig file for boards based on sama5d3x devices.

 > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
 > ---

 > Hi,

 > This is a basic defconf file for sama5d3 devices. at91boostrap, u-boot, linux
 > stuff will come later.

Thanks, but we prefer our defconfigs to just be the minimal needed to
configure buildroot for the hardware (arch/variant, bootloader, kernel)
- E.G. something like configs/nitrogen6x_defconfig

Care to send such a minimal defconfig with comments instead?

 >> From the top of my head Alexandre Belloni told me that some flags have to be
 > added for hardware floating point use. It was on a previous version when
 > hard floating has been introduced. Is it still true or does selecting EABIHF is
 > enough?

Selecting EABIHF should afaik be enough.

-- 
Bye, Peter Korsgaard
