From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:37:40 +0100
Subject: [Buildroot] [PATCH 30/33] matchbox packages: add license info
In-Reply-To: <1353543503-8952-31-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-31-git-send-email-s.martin49@gmail.com>
Message-ID: <50B13014.30301@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/matchbox/matchbox-common/matchbox-common.mk                   | 3 +++
>   package/matchbox/matchbox-desktop/matchbox-desktop.mk                 | 3 +++
>   package/matchbox/matchbox-fakekey/matchbox-fakekey.mk                 | 3 +++
>   package/matchbox/matchbox-keyboard/matchbox-keyboard.mk               | 3 +++
>   package/matchbox/matchbox-lib/matchbox-lib.mk                         | 3 +++
>   package/matchbox/matchbox-panel/matchbox-panel.mk                     | 3 +++
>   package/matchbox/matchbox-startup-monitor/matchbox-startup-monitor.mk | 3 +++
>   package/matchbox/matchbox-wm/matchbox-wm.mk                           | 3 +++
>   8 files changed, 24 insertions(+)
>
> diff --git a/package/matchbox/matchbox-common/matchbox-common.mk b/package/matchbox/matchbox-common/matchbox-common.mk
> index 993590c..2909f27 100644
> --- a/package/matchbox/matchbox-common/matchbox-common.mk
> +++ b/package/matchbox/matchbox-common/matchbox-common.mk
> @@ -7,6 +7,9 @@ MATCHBOX_COMMON_VERSION_MAJOR = 0.9
>   MATCHBOX_COMMON_VERSION = $(MATCHBOX_COMMON_VERSION_MAJOR).1
>   MATCHBOX_COMMON_SOURCE = matchbox-common-$(MATCHBOX_COMMON_VERSION).tar.bz2
>   MATCHBOX_COMMON_SITE = http://projects.o-hand.com/matchbox/sources/matchbox-common/$(MATCHBOX_COMMON_VERSION_MAJOR)
> +MATCHBOX_COMMON_LICENSE = GPLv2

  As far as I can see, all files say 'or later', so it should
be GPLv2+.  And this is for all matchbox-xxx packages.

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
