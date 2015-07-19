From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 19 Jul 2015 22:42:34 +0200
Subject: [Buildroot] [PATCH] uboot: BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR ->
 legacy
In-Reply-To: <1429903115-29129-1-git-send-email-fhunleth@troodon-software.com>
References: <1429903115-29129-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <55AC0BBA.3000403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/24/15 21:18, Frank Hunleth wrote:
> This changes BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR from deprecated to
> legacy. The added legacy handling will automatically copy the
> BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR setting to BR2_TARGET_UBOOT_PATCH,
> which should make upgrading configurations easier.
> 
> Thanks to Arnout for suggesting the switch to legacy.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

 Hi Frank,

 Thanks for this patch, but since we didn't include it in 2015.05, it's too late
to change it now. So I've marked it as rejected in patchwork.


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
