From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 24 Nov 2012 21:46:54 +0100
Subject: [Buildroot] [PATCH 26/33] igh-ethercat: add license info
In-Reply-To: <1353543503-8952-27-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-27-git-send-email-s.martin49@gmail.com>
Message-ID: <50B1323E.6070809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 01:18, Samuel Martin wrote:
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>
> ---
>   package/igh-ethercat/igh-ethercat.mk | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
> index 9182f76..d37b6d3 100644
> --- a/package/igh-ethercat/igh-ethercat.mk
> +++ b/package/igh-ethercat/igh-ethercat.mk
> @@ -1,6 +1,10 @@
>   IGH_ETHERCAT_VERSION = 1.5.1
>   IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat/
>   IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
> +# According to the README file IgH EtherCAT master is licensed under GPLv2,
> +# while the source-tree contains a copy of the GPLv2 and one of the LGPLv3
> +IGH_ETHERCAT_LICENSE = GPLv2
> +IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER

  The library is under LGPLv2.1. I guess they included the LGPLv3 by
accident.


  Regards,
  Arnout

>
>   IGH_ETHERCAT_DEPENDENCIES    = linux
>   IGH_ETHERCAT_INSTALL_STAGING = YES

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
