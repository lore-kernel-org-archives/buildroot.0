From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Mar 2012 15:32:04 +0100
Subject: [Buildroot] [PATCH 2/2] BeagleBone: new board
In-Reply-To: <1331214423-8647-2-git-send-email-fhunleth@troodon-software.com>
References: <1331214423-8647-1-git-send-email-fhunleth@troodon-software.com>
 <1331214423-8647-2-git-send-email-fhunleth@troodon-software.com>
Message-ID: <201203111532.04827.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 08 March 2012 14:47:03 Frank Hunleth wrote:
> This configuration uses the latest released kernel and u-boot versions
> supported by Beagleboard developers. The Linux kernel configuration has
> been modified to compile in EXT2 support and use gzip to compress the
> kernel.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  board/beaglebone/linux-3.2.9.config                | 3572 ++++++++++++++++++++

 Please use 'make linux-update-defconfig' to create a defconfig.  Then we
don't have to add a 3500 line file.


[snip]


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
