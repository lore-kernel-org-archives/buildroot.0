From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 May 2015 23:28:54 +0200
Subject: [Buildroot] [PATCH v3 1/1] board: add support for VIA
	VAB-820/AMOS-820
In-Reply-To: <1430812770-4374-1-git-send-email-imrehg@gmail.com>
 (imrehg@gmail.com's message of "Tue, 5 May 2015 15:59:30 +0800")
References: <1430812770-4374-1-git-send-email-imrehg@gmail.com>
Message-ID: <87oalwkrft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "imrehg" == imrehg  <imrehg@gmail.com> writes:

 > From: Gergely Imreh <imrehg@gmail.com>
 > The VIA VAB-820 board (and the AMOS-820 system built around it) is
 > based on Freescale i.MX6 for embedded and industrial computing.

 > Signed-off-by: Gergely Imreh <imrehg@gmail.com>
 > ---
 > Changes v2 -> v3:
 >   - updated to kernel 3.10.17 (from 3.0.35), and u-boot 2013.04 (from 2009.08)
 >     from the latest BSP release
 >   - added minimal patch to enable SD card default boot in updated u-boot
 >   - removed post-build script and environment defaults that used to generate
 >     boot script as not needed with the updated u-boot anymore
 >   - updated setup steps and information in readme.txt 
 >   - updated defconfig to generate suitable output for the new defaults (device
 >     tree and kernel), removed some settings where buildroot defaults now work

 > Changes v1 -> v2:
 >   - fixed typos on in readme.txt and clarified setup steps
 >   - updated defconfig kernel headers and rootfs settings (suggested by Thomas)

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
