From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 Jul 2018 23:56:16 +0200
Subject: [Buildroot] [PATCH 1/3] uboot: Introduce
 BR2_TARGET_UBOOT_FORMAT_DTB_IMX
In-Reply-To: <1530818671-20390-1-git-send-email-festevam@gmail.com>
References: <1530818671-20390-1-git-send-email-festevam@gmail.com>
Message-ID: <06b70236-e03a-c9ea-63c2-93f5526e84f1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-18 21:24, Fabio Estevam wrote:
> Some i.MX boards which use device tree to describe the hardware
> for U-Boot generate a u-boot-dtb.imx binary.
> 
> Introduce the BR2_TARGET_UBOOT_FORMAT_DTB_IMX option to
> handle such case.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

 Applied to master, thanks.

 I didn't apply the rest of the series since I had some feedback on patch 2. So
the others are marked as Changes Requested.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
