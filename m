From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 28 Jul 2012 16:36:00 +0200
Subject: [Buildroot] [PATCH 3/6] Factorize the u-boot images code
In-Reply-To: <1342528042-10038-4-git-send-email-maxime.ripard@free-electrons.com>
References: <1342528042-10038-1-git-send-email-maxime.ripard@free-electrons.com>
 <1342528042-10038-4-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <5013F8D0.4010906@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/17/12 14:27, Maxime Ripard wrote:
> This patch introduces the BR2_LINUX_KERNEL_UBOOT_IMAGE boolean to
> factorize more code that will be shared in the next patches that
> introduces other uImage-like targets.
>
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(Review only)

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
