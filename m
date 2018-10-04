From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Oct 2018 13:50:35 +0200
Subject: [Buildroot] [PATCH 19/23] python-passlib: new package
In-Reply-To: <20180926153505.3411-20-asafka7@gmail.com>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-20-asafka7@gmail.com>
Message-ID: <20181004135035.7a4562d1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 26 Sep 2018 18:35:01 +0300, Asaf Kahlon wrote:

> +PYTHON_PASSLIB_LICENSE = BSD

This is not a valid SPDX license tag, it should have been BSD-3-Clause.
Perhaps this should be fixed in scanpypi, so that it emits a warning
about the license being imprecise ?

I fixed that up, added Yegor Reviewed-by, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
