From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Nov 2010 18:49:05 +0100
Subject: [Buildroot] [PATCH] change getty port configuration
In-Reply-To: <4CA3410A.8050603@visionsystems.de>
References: <4CA3410A.8050603@visionsystems.de>
Message-ID: <20101122184905.5638e532@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Sep 2010 15:37:14 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> BR2_TARGET_GENERIC_GETTY_PORT has now a string type instead of choice.
> This makes port configuration flexible and compact.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks, merged into my for-2011.02/boards-cleanup branch. I hope to get
this branch merged after the 2010.11 release.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
