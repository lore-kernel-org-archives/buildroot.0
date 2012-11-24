From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Nov 2012 00:06:53 +0100
Subject: [Buildroot] [PATCH 23/33] scons: add license info
In-Reply-To: <1353543503-8952-24-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-24-git-send-email-s.martin49@gmail.com>
Message-ID: <50B1530D.2050403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


  Regards,
  Arnout

> ---
>   package/scons/scons.mk | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/package/scons/scons.mk b/package/scons/scons.mk
> index 45f2e1e..92cfe93 100644
> --- a/package/scons/scons.mk
> +++ b/package/scons/scons.mk
> @@ -1,6 +1,9 @@
>   SCONS_VERSION = 2.0.1
>   SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
>   SCONS_SITE = http://downloads.sourceforge.net/project/scons/scons/$(SCONS_VERSION)
> +SCONS_LICENSE = MIT
> +SCONS_LICENSE_FILES = LICENSE.txt
> +
>   HOST_SCONS_DEPENDENCIES = $(NEED_PYTHON2)
>
>   define HOST_SCONS_BUILD_CMDS

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
