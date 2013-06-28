From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 28 Jun 2013 21:42:42 +0200
Subject: [Buildroot] [PATCH 13/19] libcap-ng: define license
In-Reply-To: <1372426876-2258-13-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 28 Jun 2013 10:41:10 -0300")
References: <1372426876-2258-1-git-send-email-gustavo@zacarias.com.ar>
 <1372426876-2258-13-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u7myqbx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/libcap-ng/libcap-ng.mk | 2 ++
 Gustavo>  1 file changed, 2 insertions(+)

 Gustavo> diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
 Gustavo> index d1c4462..630089b 100644
 Gustavo> --- a/package/libcap-ng/libcap-ng.mk
 Gustavo> +++ b/package/libcap-ng/libcap-ng.mk
 Gustavo> @@ -10,5 +10,7 @@ LIBCAP_NG_SOURCE = libcap-ng-$(LIBCAP_NG_VERSION).tar.gz
 Gustavo>  LIBCAP_NG_INSTALL_STAGING = YES
 Gustavo>  LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 Gustavo>  LIBCAP_NG_CONF_OPT = --without-python
 Gustavo> +LIBCAP_NG_LICENSE = GPLv2+ LGPLv2+

It's LGPLv2.1+

-- 
Bye, Peter Korsgaard
