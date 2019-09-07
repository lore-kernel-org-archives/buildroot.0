From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 14:37:48 +0200
Subject: [Buildroot] [PATCH 1/2] hostapd: remove support for Realtek
 drivers
In-Reply-To: <20190906102101.4676-1-alexander.i.mukhin@gmail.com>
References: <20190906102101.4676-1-alexander.i.mukhin@gmail.com>
Message-ID: <20190907143748.745d2899@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Fri,  6 Sep 2019 13:21:00 +0300
Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:

> After hostapd update to 2.9, the patch provided no longer works,
> although applies. Moreover, AP support for Realtek chips is broken
> anyway in kernels > 4.9.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

The commit title prefix should have been "package/hostapd", and also
when removing an option, it must be added in Config.in.legacy. I fixed
both issues and applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
