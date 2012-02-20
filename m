From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Feb 2012 09:48:18 +0100
Subject: [Buildroot] [PATCH 2/2] Microblaze: added external toolchain
	from Xilinx
In-Reply-To: <22621d522680079cb3b800f28a03d771a238f875.1329651936.git.alvaro.gamez@hazent.com>
References: <e00406c0e4c15d77b4d03badf312980cce713c06.1329651936.git.alvaro.gamez@hazent.com>
 <22621d522680079cb3b800f28a03d771a238f875.1329651936.git.alvaro.gamez@hazent.com>
Message-ID: <201202200948.19050.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 19 February 2012 13:17:10 Alvaro G. M wrote:
> +TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;hb=HEAD;f=

 I don't really like the use of HEAD here, because it makes the build
unreproducible.  Don't they have anything like release tags?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
