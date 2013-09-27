From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 27 Sep 2013 09:30:39 +0200
Subject: [Buildroot] [PATCH 1/1] package: fix github download URL
In-Reply-To: <1380195788-32432-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1380195788-32432-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <CAAXf6LXidrhUgRtAZtCv3wXtv=uZOKznfvn8JhVEDm+5D6G+Yg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jerzy,

On Thu, Sep 26, 2013 at 1:43 PM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/cpuload/cpuload.mk                       |    4 ++--
>  package/fb-test-app/fb-test-app.mk               |    4 ++--
>  package/input-event-daemon/input-event-daemon.mk |    4 ++--
>  package/lcdapi/lcdapi.mk                         |    4 ++--
>  package/libcec/libcec.mk                         |    4 ++--
>  package/libiqrf/libiqrf.mk                       |    4 ++--
>  package/luasql/luasql.mk                         |    4 ++--
>  package/tinymembench/tinymembench.mk             |    4 ++--
>  package/xl2tp/xl2tp.mk                           |    4 ++--
>  9 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/package/cpuload/cpuload.mk b/package/cpuload/cpuload.mk
> index e0b8ccf..d00c3a4 100644
> --- a/package/cpuload/cpuload.mk
> +++ b/package/cpuload/cpuload.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -CPULOAD_VERSION = v0.3
> -CPULOAD_SITE = http://github.com/kelvincheung/cpuload/tarball/$(CPULOAD_VERSION)
> +CPULOAD_VERSION = 0.3
> +CPULOAD_SITE = https://github.com/kelvincheung/cpuload/tarball/v$(CPULOAD_VERSION)
>  CPULOAD_LICENSE = GPLv2
>  CPULOAD_LICENSE_FILES = COPYING
>
> diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
> index a2183e0..3c14c4f 100644
> --- a/package/fb-test-app/fb-test-app.mk
> +++ b/package/fb-test-app/fb-test-app.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -FB_TEST_APP_VERSION = v1.0.0
> -FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball/$(FB_TEST_APP_VERSION)
> +FB_TEST_APP_VERSION = 1.0.0
> +FB_TEST_APP_SITE = https://github.com/prpplague/fb-test-app/tarball/v$(FB_TEST_APP_VERSION)
>  FB_TEST_APP_LICENSE = GPLv2
>  FB_TEST_APP_LICENSE_FILES = COPYING
>
> diff --git a/package/input-event-daemon/input-event-daemon.mk b/package/input-event-daemon/input-event-daemon.mk
> index 762d3c2..4ce123f 100644
> --- a/package/input-event-daemon/input-event-daemon.mk
> +++ b/package/input-event-daemon/input-event-daemon.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -INPUT_EVENT_DAEMON_VERSION = v0.1.3
> -INPUT_EVENT_DAEMON_SITE = http://github.com/gandro/input-event-daemon/tarball/$(INPUT_EVENT_DAEMON_VERSION)
> +INPUT_EVENT_DAEMON_VERSION = 0.1.3
> +INPUT_EVENT_DAEMON_SITE = https://github.com/gandro/input-event-daemon/tarball/v$(INPUT_EVENT_DAEMON_VERSION)
>  INPUT_EVENT_DAEMON_LICENSE = input-event-daemon license
>  INPUT_EVENT_DAEMON_LICENSE_FILES = README
>
> diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
> index 1b7ea43..73c798e 100644
> --- a/package/lcdapi/lcdapi.mk
> +++ b/package/lcdapi/lcdapi.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LCDAPI_VERSION = v0.4
> -LCDAPI_SITE = http://github.com/spdawson/lcdapi/tarball/$(LCDAPI_VERSION)
> +LCDAPI_VERSION = 0.4
> +LCDAPI_SITE = https://github.com/spdawson/lcdapi/tarball/v$(LCDAPI_VERSION)
>  LCDAPI_LICENSE = LGPLv2.1+
>  LCDAPI_LICENSE_FILES = COPYING
>
> diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
> index 8a58e1e..10f9c26 100644
> --- a/package/libcec/libcec.mk
> +++ b/package/libcec/libcec.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LIBCEC_VERSION = libcec-2.1.1
> -LIBCEC_SITE = http://github.com/Pulse-Eight/libcec/tarball/$(LIBCEC_VERSION)
> +LIBCEC_VERSION = 2.1.1
> +LIBCEC_SITE = https://github.com/Pulse-Eight/libcec/tarball/libcec-$(LIBCEC_VERSION)
>  LIBCEC_LICENSE = GPLv2+
>  LIBCEC_LICENSE_FILES = COPYING
>
> diff --git a/package/libiqrf/libiqrf.mk b/package/libiqrf/libiqrf.mk
> index 6c33654..1907303 100644
> --- a/package/libiqrf/libiqrf.mk
> +++ b/package/libiqrf/libiqrf.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LIBIQRF_VERSION = v0.1.2
> -LIBIQRF_SITE = http://github.com/nandra/libiqrf/tarball/$(LIBIQRF_VERSION)
> +LIBIQRF_VERSION = 0.1.2
> +LIBIQRF_SITE = https://github.com/nandra/libiqrf/tarball/v$(LIBIQRF_VERSION)
>  LIBIQRF_INSTALL_STAGING = YES
>
>  LIBIQRF_DEPENDENCIES = libusb
> diff --git a/package/luasql/luasql.mk b/package/luasql/luasql.mk
> index 6fbdccc..21c102b 100644
> --- a/package/luasql/luasql.mk
> +++ b/package/luasql/luasql.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -LUASQL_VERSION = v2.3.0
> -LUASQL_SITE = https://github.com/keplerproject/luasql/tarball/$(LUASQL_VERSION)
> +LUASQL_VERSION = 2.3.0
> +LUASQL_SITE = https://github.com/keplerproject/luasql/tarball/v$(LUASQL_VERSION)
>  LUASQL_LICENSE = MIT
>  LUASQL_LICENSE_FILES = README
>  LUASQL_DEPENDENCIES = lua
> diff --git a/package/tinymembench/tinymembench.mk b/package/tinymembench/tinymembench.mk
> index 732616f..bb280af 100644
> --- a/package/tinymembench/tinymembench.mk
> +++ b/package/tinymembench/tinymembench.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -TINYMEMBENCH_VERSION = v0.2
> -TINYMEMBENCH_SITE = http://github.com/ssvb/tinymembench/tarball/$(TINYMEMBENCH_VERSION)
> +TINYMEMBENCH_VERSION = 0.2
> +TINYMEMBENCH_SITE = https://github.com/ssvb/tinymembench/tarball/v$(TINYMEMBENCH_VERSION)
>  TINYMEMBENCH_LICENSE = MIT
>  TINYMEMBENCH_LICENSE_FILES = main.c
>
> diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
> index 7b0a228..7b8e015 100644
> --- a/package/xl2tp/xl2tp.mk
> +++ b/package/xl2tp/xl2tp.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -XL2TP_VERSION = v1.3.1
> -XL2TP_SITE = http://github.com/xelerance/xl2tpd/tarball/$(XL2TP_VERSION)
> +XL2TP_VERSION = 1.3.1
> +XL2TP_SITE = https://github.com/xelerance/xl2tpd/tarball/v$(XL2TP_VERSION)
>  XL2TP_DEPENDENCIES = libpcap
>
>  define XL2TP_BUILD_CMDS
> --


Content-wise this looks fine (not tested) but in this case I think
that there should be a little more info in the commit message: 'fix'
is not really correct as everything worked before. The only reason
you're doing this is to make the names of the tarballs and the build
directories nicer.

Also, I think you should update the manual to explain the rationale
and update the example (it explicitly uses v1.0).

Best regards,
Thomas
