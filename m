From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 06 Sep 2012 07:52:33 +0200
Subject: [Buildroot] [PATCHv2] u-boot: add version 2012.07
In-Reply-To: <1346766923-29838-1-git-send-email-gustavo@zacarias.com.ar>
References: <1346766923-29838-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <50483A21.5060604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/12 15:55, Gustavo Zacarias wrote:
> diff --git a/package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch b/package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
> similarity index 100%
> rename from package/uboot-tools/uboot-tools-2012.04.01-drop-configh-from-tools.patch
> rename to package/uboot-tools/uboot-tools-2012.07-drop-configh-from-tools.patch
> diff --git a/package/uboot-tools/uboot-tools-2012.04.01-hostcflags-override-fix.patch b/package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
> similarity index 100%
> rename from package/uboot-tools/uboot-tools-2012.04.01-hostcflags-override-fix.patch
> rename to package/uboot-tools/uboot-tools-2012.07-hostcflags-override-fix.patch
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk

  Is there any reason to keep the version number for uboot-tools patches?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
