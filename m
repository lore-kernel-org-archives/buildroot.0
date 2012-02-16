From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 01:01:08 +0100
Subject: [Buildroot] [PATCH 2/3 v2] uboot: add a new binary format for
	u-boot.img
In-Reply-To: <1329343455-32714-3-git-send-email-n-dechesne@ti.com>
References: <1329343455-32714-1-git-send-email-n-dechesne@ti.com>
 <1329343455-32714-3-git-send-email-n-dechesne@ti.com>
Message-ID: <201202160101.08184.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 15 February 2012 23:04:14 Nicolas Dechesne wrote:
> For some platforms like OMAP, a new binary format is now being used
> for u-boot: u-boot.img. It is basically u-boot.bin which has been
> processed with mkimage.

 Isn't this mainly SPL that requires the .img?  If so, I would make
IMG the default format if SPL is selected.  I'm not sure if that's
possible in Kconfig, though.

> 
> Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
