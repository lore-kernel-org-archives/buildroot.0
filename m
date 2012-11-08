From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 08 Nov 2012 09:34:48 +0100
Subject: [Buildroot] [PATCH v2] package: add bcusdk
In-Reply-To: <1352192728-4816-2-git-send-email-gregory.hermant@calao-systems.com>
References: <1352192728-4816-1-git-send-email-gregory.hermant@calao-systems.com>
 <1352192728-4816-2-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <509B6EA8.3090605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  BTW, we usually give such patches the title

bcusdk: new package

On 11/06/12 10:05, Gregory Hermant wrote:
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>
[snip]
> diff --git a/package/bcusdk/Config.in b/package/bcusdk/Config.in
> new file mode 100644
> index 0000000..c7b1b95
> --- /dev/null
> +++ b/package/bcusdk/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_BCUSDK
> +	bool "bcusdk"
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	select BR2_PACKAGE_LIBPTHSEM

  ... and the architecture dependencies of libpthsem...

> +	help
> +	  A free development environment for BCU1 and BCU2

  It would be nice if there was a description of what BCU is.

  Otherwise, it looks good!


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
