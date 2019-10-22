From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 20:39:31 +0200
Subject: [Buildroot] [PATCH v5 1/2] package/jitterentropy-library: new
 package
In-Reply-To: <20191022181732.38981-1-matthew.weber@rockwellcollins.com>
References: <20191022181732.38981-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191022203931.29cac771@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 22 Oct 2019 13:17:31 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> +JITTERENTROPY_LIBRARY_VERSION = 2.1.2
> +JITTERENTROPY_LIBRARY_SITE = $(call github,smuellerDD,$(JITTERENTROPY_LIBRARY_NAME),v$(JITTERENTROPY_LIBRARY_VERSION))
> +JITTERENTROPY_LIBRARY_LICENSE = GPL-2.0, BSD-3-Clause

It is actually GPL-2.0 or BSD-3-Clause, so I fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
