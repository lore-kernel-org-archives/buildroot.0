From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 23:13:44 +0200
Subject: [Buildroot] [PATCH v2 8/9] atmel: add a flashing helper and
 documentation
In-Reply-To: <1431544977-2274-9-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1431544977-2274-9-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20150518231344.0c9f0dbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexandre Belloni,

On Wed, 13 May 2015 21:22:56 +0200, Alexandre Belloni wrote:
> Provide a flashing helper to properly select the sam-ba configuration
> and reuse the sam-ba tcl script provided by Atmel with minimal
> modifications.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> ---
>  board/atmel/flasher.sh    |  74 ++++++++++
>  board/atmel/nandflash.tcl | 346 ++++++++++++++++++++++++++++++++++++++++++++++
>  board/atmel/nandflash.txt | 106 ++++++++++++++

This file should really be called readme.txt and not nandflash.txt. I
know it doesn't cover anything but NAND flash for the moment, but
readme.txt is really the convention we use for all platforms.

Otherwise, great job. I really like the tutorial covering all the
evaluation boards, with details on connecting the debug UART and the
USB device cable.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
