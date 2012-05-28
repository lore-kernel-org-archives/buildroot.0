From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 28 May 2012 22:37:40 +0200
Subject: [Buildroot] [PATCH v3 2/3] Add mobile-broadband-provider-info
	package.
In-Reply-To: <1333288729-22138-3-git-send-email-marek.belisko@open-nandra.com>
 (Marek Belisko's message of "Sun, 1 Apr 2012 15:58:48 +0200")
References: <1333288729-22138-1-git-send-email-marek.belisko@open-nandra.com>
 <1333288729-22138-3-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <87aa0s6nzf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marek" == Marek Belisko <marek.belisko@open-nandra.com> writes:

 Marek> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>

Committed with minor tweaks to next, thanks (see below).

 Marek> +++ b/package/mobile-broadband-provider-info/mobile_broadband_provider_info.mk
 Marek> @@ -0,0 +1,14 @@
 Marek> +#############################################################
 Marek> +#
 Marek> +# mobile broadband provider info
 Marek> +#
 Marek> +#############################################################
 Marek> +MOBILE_BROADBAND_PROVIDER_INFO_VERSION = 20110511
 Marek> +MOBILE_BROADBAND_PROVIDER_INFO_SITE = git://git.gnome.org/mobile-broadband-provider-info
 Marek> +MOBILE_BROADBAND_PROVIDER_INFO_INSTALL_STAGING = YES
 Marek> +MOBILE_BROADBAND_PROVIDER_INFO_DEPENDENCIES = host-pkg-config
 Marek> +
 Marek> +MOBILE_BROADBAND_PROVIDER_INFO_AUTORECONF=YES

Space around '=' please.

 Marek> +
 Marek> +$(eval $(call AUTOTARGETS))
 Marek> +

And no empty lines after AUTOTARGETS.

-- 
Bye, Peter Korsgaard
