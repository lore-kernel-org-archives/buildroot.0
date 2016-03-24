From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 23:11:17 +0100
Subject: [Buildroot] [PATCH v2 4/4] board/atmel: merge and update
 documentation
In-Reply-To: <1458830564-27350-4-git-send-email-ludovic.desroches@atmel.com>
References: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
 <1458830564-27350-4-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160324231117.492e2b6d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 15:42:44 +0100, Ludovic Desroches wrote:
> There were two readme files (one for flashing on NAND and one to create a
> SD card) in different places. Merge them and update the SD card
> generation part since all Xplained boards are supported and the -u
> option of sfdisk is obsolete on latest versions.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

I've slightly tweaked the explanation about NAND flash vs. SD card
configurations, and moved the SD card discussion after the NAND flash
discussion. Then I've applied.

Thanks for having taken the time to refactor the two documents into one!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
