From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Jan 2019 11:08:00 +0100
Subject: [Buildroot] [PATCH 1/1] test-pkg: Force checking dependencies.
In-Reply-To: <20181231184317.107597-1-aduskett@gmail.com>
References: <20181231184317.107597-1-aduskett@gmail.com>
Message-ID: <20190101110800.5baf2ebf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Commit title:

	utils/test-pkg: force checking dependencies

On Mon, 31 Dec 2018 13:43:17 -0500, aduskett at gmail.com wrote:

> Pass the environment variable "FORCE_CHECK_DEPENDENCIES"  to the Makefile in

Don't we have a rule that "internal" variables like this should have a
BR_ prefix, i.e BR_FORCE_CHECK_DEPENDENCIES ?

I thought we had documented this somewhere, but can't find it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
