From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Aug 2012 14:21:51 +0200
Subject: [Buildroot] [PATCH] Add custom boards support for Atmel SAM-BA
 software
In-Reply-To: <503DE6F7.8050702@calao-systems.com>
References: <503DE6F7.8050702@calao-systems.com>
Message-ID: <20120829142151.20102d18@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 29 Aug 2012 11:55:03 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> +config BR2_TARGET_SAM_BA_CUSTOM_PATCH_DIR

This should be BR2_HOST_SAM_BA...

Also, could you send this together with another patch that actually
uses this feature for at least one board, so we can see the type of
patches that it is going to add?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
