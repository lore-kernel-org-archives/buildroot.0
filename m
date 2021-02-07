From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Feb 2021 22:49:21 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support
 for Arrow Avenger96 board
In-Reply-To: <87h7mnyi4p.fsf@tarshish> (Baruch Siach's message of "Sun, 07 Feb
 2021 18:09:26 +0200")
References: <20210207155534.7211-1-peter@korsgaard.com>
 <87h7mnyi4p.fsf@tarshish>
Message-ID: <874kinzgym.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Feb 07 2021, Peter Korsgaard wrote:
 >> +How to write the microSD card
 >> +=============================
 >> +
 >> +Once the build process is finished you will have an image called
 >> +"sdcard.img" in the output/images/ directory.
 >> +
 >> +Copy the bootable "sdcard.img" onto an microSD card with "dd":
 >> +
 >> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX

 > Maybe warn that this overwrites data on the SD card.

Sure, I can add this. Notice that this is a direct cut'n'paste of
board/stmicroelectronics/stm32mp157c-dk2/readme.txt

 >> +
 >> +Boot the board
 >> +==============
 >> +
 >> + (1) Configure the boot switches for boot from microsd: 1-0-1
 >> +
 >> + (2) Insert the microSD card in the slow

 > Slot?

Ups, indeed - Will fix.

-- 
Bye, Peter Korsgaard
