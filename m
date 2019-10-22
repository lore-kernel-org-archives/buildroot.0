From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 23:21:55 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/snmpclitools: new package
In-Reply-To: <20191009172421.10069-2-asafka7@gmail.com>
References: <20191009172421.10069-1-asafka7@gmail.com>
 <20191009172421.10069-2-asafka7@gmail.com>
Message-ID: <20191022232155.7c9f3eef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  9 Oct 2019 20:24:21 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> +SNMPCLITOOLS_VERSION = 0.6.4
> +SNMPCLITOOLS_SOURCE = snmpclitools-$(SNMPCLITOOLS_VERSION).tar.gz

This is the default value for the _SOURCE variable, so it is not
needed. check-package triggers a warning for this.

I fixed this, and applied. I actually applied this one before the
removal of python-pysnmp-apps.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
