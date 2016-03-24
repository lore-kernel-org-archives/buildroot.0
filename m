From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 09:44:36 +0100
Subject: [Buildroot] [PATCH 4/4] board/atmel/xplained/readme.txt: update
 documentation
In-Reply-To: <1458808152-15778-4-git-send-email-ludovic.desroches@atmel.com>
References: <1458808152-15778-1-git-send-email-ludovic.desroches@atmel.com>
 <1458808152-15778-4-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160324094436.128dbd74@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 09:29:12 +0100, Ludovic Desroches wrote:
> This documentation is not only dedicated to SAMA5D3 Xplained boards. The
> procedure is the same for SAMA5D4 and SAMA5D2.
> sfdisk, -u (--unit) option is obsolete on latest versions.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  board/atmel/xplained/readme.txt | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)

There is some duplication of information between board/atmel/readme.txt
(which also covers SAMA5 Xplained platforms) and
board/atmel/xplained/readme.txt.

Perhaps board/atmel/xplained/readme.txt should be removed entirely, and
board/atmel/readme.txt contain all the information?

Seems like board/atmel/readme.txt covers how to flash on NAND, while
board/atmel/xplained/readme.txt covers how to use a SD card based
booting. Definitely not very clear when looking at the readme.txt
location.

Another possible (but future, and unrelated) improvement is to use
genimage to generate a ready-to-use SD card image, which automatically
contains the VFAT and ext4 partitions.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
