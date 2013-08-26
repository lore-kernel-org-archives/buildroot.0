From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Aug 2013 19:33:43 +0200
Subject: [Buildroot] [PATCH 1/6] libdrm: bump and add experimental ARM
 framebuffer support
In-Reply-To: <1377373321-29732-2-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-2-git-send-email-spenser@gillilanding.com>
Message-ID: <521B9177.6040001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/24/13 21:41, Spenser Gilliland wrote:
> The newer versions of libdrm have substantially fewer dependencies as drm is
> moving to be a subsystem for both wayland and Xorg.

  I guess the remaining XLIB dependencies should then also move out of 
the Xorg condition, so that libdrm can move out of it as well...

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
