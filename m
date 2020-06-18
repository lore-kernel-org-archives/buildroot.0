From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 09:25:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/open-plc-utils: install
 packages to /usr/bin
In-Reply-To: <20200617222159.176141-2-aduskett@gmail.com>
References: <20200617222159.176141-1-aduskett@gmail.com>
 <20200617222159.176141-2-aduskett@gmail.com>
Message-ID: <20200618092504.393decb1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Jun 2020 15:21:59 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> By default, open-plc-utils installs all of the compiled binaries to
> /usr/local/bin which is not in the default path provided by Buildroot.
> 
> Passing BIN="$(TARGET_DIR)/usr/bin" to make install forces open-plc-utils to
> install the compiled binaries to /usr/bin.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Is this something related to the version bump, or independent, i.e
something that already happens with the open-plc-utils currently in
Buildroot?

In the latter case, then this fix should have come as a first patch in
the series, so that it's clear it's a fix for something that is broken
today, so that we know it needs to be backported to 2020.02.x and
2020.05.x.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
