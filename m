From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 08:22:18 +0200
Subject: [Buildroot] [PATCH] package/android-tools: host-android-tools
 need pkg-conf
In-Reply-To: <20190409131754.24516-1-giulio.benetti@micronovasrl.com>
References: <20190409131754.24516-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190411082218.2503be2d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  9 Apr 2019 15:17:54 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

>  ANDROID_TOOLS_DEPENDENCIES = host-pkgconf
> +HOST_ANDROID_TOOLS_DEPENDENCIES = $(ANDROID_TOOLS_DEPENDENCIES)

We don't typically re-use the target dependencies variable for the host
dependencies. So I changed this to = host-pkgconf and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
