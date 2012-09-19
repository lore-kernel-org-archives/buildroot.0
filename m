From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 19 Sep 2012 22:41:34 +0200
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <505A2DFE.3060604@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/19/12 14:52, Waldemar Rymarkiewicz wrote:
[snip]
> +config BR2_PACKAGE_PCSC_LITE_DEBUGART

  _DEBUGATR, not ART

> +	bool "enable ATR debug messages"
> +	help
> +	  enable ATR debug messages from pcscd
> +
> +config BR2_PACKAGE_PCSC_LITE_EMBEDDED
> +	bool "enable embedded mode"
> +	help
> +	  limit RAM and CPU ressources by disabling features (log)

  resources (one s)


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
