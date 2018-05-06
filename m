From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 May 2018 22:23:29 +0200
Subject: [Buildroot] [PATCH 1/1] libkcapi: split
 BR2_PACKAGE_LIBKCAPI_APPS
In-Reply-To: <20180506200608.8992-1-fontaine.fabrice@gmail.com>
References: <20180506200608.8992-1-fontaine.fabrice@gmail.com>
Message-ID: <20180506222329.7ce06139@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun,  6 May 2018 22:06:08 +0200, Fabrice Fontaine wrote:

> -config BR2_PACKAGE_LIBKCAPI_APPS
> -	bool "build test applications"

Since you're removing a Config.in option, you need to add proper
handling in Config.in.legacy.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
