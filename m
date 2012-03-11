From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 11 Mar 2012 16:33:27 +0100
Subject: [Buildroot] [PATCH 1/2] uboot: Add support for copying MLO to
	the images directory for U-boot builds that include it.
In-Reply-To: <1331214423-8647-1-git-send-email-fhunleth@troodon-software.com>
References: <1331214423-8647-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <201203111633.27504.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 08 March 2012 14:47:02 Frank Hunleth wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

 Nicolas Dechesne posted patches for adding MLO a while ago.  I don't
remember if they were ready to be merged or not.  But this one looks
pretty good.  So:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> +config BR2_TARGET_UBOOT_MLO
> +	bool "MLO"
> +	help
> +	  Copy the X-Loader binary (MLO) to the images directory for 
> +	  U-boot builds that generate it.

 Actually, in U-Boot terminology it's the SPL.  The binary is called
MLO because the ROM bootloader looks for a file called MLO.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
