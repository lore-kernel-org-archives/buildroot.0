From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Jun 2012 01:59:15 +0200
Subject: [Buildroot] [PATCH] gstreamer: add xorg support
In-Reply-To: <1338749471-20828-1-git-send-email-spdawson@gmail.com>
References: <1338749471-20828-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FCD4BD3.5000601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 20:51, spdawson at gmail.com wrote:
> +ifeq ($(BR2_PACKAGE_XORG7),y)
> +GST_PLUGINS_BASE_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXv

  You'll also want the corresponding select statements in Config.in.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
