From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 01:14:16 +0200
Subject: [Buildroot] [PATCH] fb-test-app: new package
In-Reply-To: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
References: <1349443899-23353-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <506F69C8.2010907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/12 15:31, ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches<ludovic.desroches@atmel.com>

Add a Signed-off-by line for yourself.  This is a short way for you to
assert that you are entitled to contribute the patch under buildroot's
GPL license.  See  http://kerneltrap.org/files/Jeremy/DCO.txt for more
details.

[snip]
> diff --git a/package/fb-test-app/Config.in b/package/fb-test-app/Config.in
> new file mode 100644
> index 0000000..6b682ce
> --- /dev/null
> +++ b/package/fb-test-app/Config.in
> @@ -0,0 +1,4 @@
> +config BR2_PACKAGE_FB_TEST_APP
> +	bool "fb-test-app"
> +	help
> +	  Test suite for Linux framebuffer.

  Could you add an upstream URL to the help text?

> diff --git a/package/fb-test-app/fb-test-app.mk b/package/fb-test-app/fb-test-app.mk
> new file mode 100644
> index 0000000..ce31f05
> --- /dev/null
> +++ b/package/fb-test-app/fb-test-app.mk
> @@ -0,0 +1,34 @@
> +#############################################################
> +#
> +# fb-test-app
> +#
> +#############################################################
> +
> +FB_TEST_APP_VERSION = v1.0.0
> +FB_TEST_APP_SITE = git://github.com/prpplague/fb-test-app.git

FB_TEST_APP_SITE = http://github.com/prpplague/fb-test-app/tarball

  downloads a lot faster.

  Otherwise, looks great.


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
