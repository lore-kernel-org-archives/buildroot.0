From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:53:10 +0100
Subject: [Buildroot] [PATCH 1/2] package/cunit: new package
In-Reply-To: <1541098696-25824-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1541098696-25824-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181129225310.3c413627@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  1 Nov 2018 13:58:15 -0500, Matt Weber wrote:

> +CUNIT_VERSION = 2.1-3
> +CUNIT_SITE = http://downloads.sourceforge.net/project/cunit/CUnit/$(CUNIT_VERSION)
> +CUNIT_SOURCE = CUnit-$(CUNIT_VERSION).tar.bz2
> +CUNIT_INSTALL_STAGING = YES
> +CUNIT_LICENSE = LGPL-2.0

Actually the license is LGPL-2.0+.

I've applied to next after fixing this. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
