From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 06 Feb 2013 21:04:26 +0100
Subject: [Buildroot] [PATCH 1/5] ffmpeg: define license
In-Reply-To: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <5112B74A.2030903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/02/13 17:24, Luca Ceresoli wrote:
> How about making it more "automagic", such as:
>
> ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
> FFMPEG_LICENSE = LGPLv2.1+, GPLv2+, libjpeg license
> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1 COPYING.GPLv2
> else
> FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
> endif

  Sounds good to me!

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
