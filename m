From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 13:45:28 +0200
Subject: [Buildroot] [PATCH 1/3] Patches for Aria G25 board based on
 Buildroot 2016.08
In-Reply-To: <1474537834-6002-1-git-send-email-biagio.hkr@gmail.com>
References: <1474537834-6002-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160922134528.439d6d3a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 11:50:32 +0200, Biagio Montaruli wrote:
> - configs/acmesystems_aria_g25_128mb_defconfig,
>   configs/acmesystems_aria_g25_256mb_defconfig :
>   update default configuration files for both 128MB and 256MB version
> 
> - board/acmesystems/aria-g25/genimage.cfg
>   board/acmesystems/aria-g25/post-image.sh :
>   add support for genimage in order to build sdcard.img
> 
> - board/acmesystems/aria-g25/readme.txt : update documentation
>   for Aria G25 and add notes about how to build sdcard.img
> 
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>

Applied after fixing the commit title and rewrapping the text in the
readme.txt file.

Do you want to be notified for future changes, or build problems
related to this configuration? If so, can you please send a patch
modifying the DEVELOPERS file, like this:

N:	Your name <youremail>
F:	board/acmesystems/<name of the board>
F:	configs/<name of the defconfig>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
