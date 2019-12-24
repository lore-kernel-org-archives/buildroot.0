From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 24 Dec 2019 13:45:57 +0100
Subject: [Buildroot] [PATCH] package/fontconfig: Fix UUIDD dependency
In-Reply-To: <20191224112330.14173-1-michael@amarulasolutions.com>
References: <20191224112330.14173-1-michael@amarulasolutions.com>
Message-ID: <20191224134557.43cadbf2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Tue, 24 Dec 2019 12:23:30 +0100
Michael Trimarchi <michael@amarulasolutions.com> wrote:

> The build with BR2_PACKAGE_XORG7 and BR2_PACKAGE_OPENJDK
> was failing for missing include of uuid support.
> The BR2_PACKAGE_UTIL_LINUX_UUIDD select automatically
> BR2_PACKAGE_UTIL_LINUX_LIBUUID but the first one is needed
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Thanks for your patch! Could you give some more details about the
configuration that is failing and the exact error you are getting ?

Indeed, fontconfig does not fail to build in the autobuilders, so I'd
like to understand what is the exact issue, and make sure we are doing
the right fix.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
