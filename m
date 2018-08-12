From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:11:49 +0200
Subject: [Buildroot] [PATCH 01/18] perl-appconfig: new package
In-Reply-To: <20180810161502.21598-2-chrismcc@gmail.com>
References: <20180810161502.21598-1-chrismcc@gmail.com>
 <20180810161502.21598-2-chrismcc@gmail.com>
Message-ID: <20180812231149.5cce522b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 09:14:45 -0700, Christopher McCrory wrote:

> diff --git a/package/perl-appconfig/Config.in b/package/perl-appconfig/Config.in
> new file mode 100644
> index 0000000000..ca2220f1c0
> --- /dev/null
> +++ b/package/perl-appconfig/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PERL_APPCONFIG
> +	bool "perl-appconfig"
> +	help
> +	  AppConfig is a bundle of Perl5 modules for reading configuration files and parsing command line arguments.

This line was too long, make sure to run utils/check-package on your
packages before submission.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
