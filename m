From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:22:33 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/python-pysnmp-apps: remove
 package
In-Reply-To: <20191009172421.10069-1-asafka7@gmail.com>
References: <20191009172421.10069-1-asafka7@gmail.com>
Message-ID: <20191022232233.410738cc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 20:24:20 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The package was renamed to snmpclient and is no longer maintained.

The package was renamed to snmpclitools, not snmpclient.

> +config BR2_PACKAGE_PYTHON_PYSNMP_APPS
> +	bool "python-pysnmp-apps projcet was moved"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_SNMPCLITOOLS
> +	help
> +	  Upstream moved the pysnmp-apps project to snmpclitools.
> +	  Use it instead.

I slightly improved the wording here, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
