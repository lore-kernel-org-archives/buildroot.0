From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Apr 2017 23:12:42 +0200
Subject: [Buildroot] [PATCH 9/9] xenomai: add string option for
 additional configure options
In-Reply-To: <20170419200007.12590-10-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
 <20170419200007.12590-10-patrickdepinguin@gmail.com>
Message-ID: <20170420231242.3e23ab01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 22:00:07 +0200, Thomas De Schampheleire wrote:

> +config BR2_PACKAGE_XENOMAI_ADDITIONAL_CONF_OPTS
> +	string "Additional configure options"
> +	help
> +	  Specify any additional options to pass to the configure script here.

Line too long. Please use check-package! :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
