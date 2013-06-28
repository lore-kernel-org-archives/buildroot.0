From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Jun 2013 21:45:34 +0200
Subject: [Buildroot] [PATCH 15/19] rdesktop: define license
In-Reply-To: <1372426876-2258-15-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 28 Jun 2013 10:41:12 -0300")
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
 <1372426876-2258-15-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87wqpexbmp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/rdesktop/rdesktop.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/rdesktop/rdesktop.mk b/package/rdesktop/rdesktop.mk
 Gustavo> index fa7359c..75d0d98 100644
 Gustavo> --- a/package/rdesktop/rdesktop.mk
 Gustavo> +++ b/package/rdesktop/rdesktop.mk
 Gustavo> @@ -9,5 +9,7 @@ RDESKTOP_SOURCE = rdesktop-$(RDESKTOP_VERSION).tar.gz
 Gustavo>  RDESKTOP_SITE = http://downloads.sourceforge.net/project/rdesktop/rdesktop/$(RDESKTOP_VERSION)
 Gustavo>  RDESKTOP_DEPENDENCIES = openssl xlib_libX11 xlib_libXt
 Gustavo>  RDESKTOP_CONF_OPT = --with-openssl=$(STAGING_DIR)/usr
 Gustavo> +RDESKTOP_LICENSE = GPLv2+

I've changed this to 'GPLv2+ with exceptions' because of the openssl
exception.

-- 
Bye, Peter Korsgaard
