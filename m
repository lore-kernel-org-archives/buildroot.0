From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 6 Aug 2018 20:42:55 +0200
Subject: [Buildroot] [PATCH v2] minicom: update package to use git
 repository.
In-Reply-To: <20180801211233.48005-1-giulio.benetti@micronovasrl.com>
References: <20180801211233.48005-1-giulio.benetti@micronovasrl.com>
Message-ID: <f66b2b65-8779-9720-8b4a-14365fb04542@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Il 01/08/2018 23:12, Giulio Benetti ha scritto:
> +# configure is missing and minicom is not compatible with our autoreconf
> +# mechanism so we have to do it manually instead of using MINICOM_AUTORECONF = YES
> +define MINICOM_MKDIR_M4
> +	mkdir -p $(@D)/m4
> +endef
> +MINICOM_POST_PATCH_HOOKS += MINICOM_MKDIR_M4

Comment is wrong, neet to correct it explaining M4 folder workaround.
I reject this patch on patchwork and re-submit corrected.

Sorry.

Giulio Benetti
