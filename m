From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 18:41:04 +0100
Subject: [Buildroot] [PATCH 1/1] libcpprestsdk: bump version to v2.10.8
In-Reply-To: <20181223225518.48902-1-aduskett@gmail.com>
References: <20181223225518.48902-1-aduskett@gmail.com>
Message-ID: <20181226184104.536fc1a4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Dec 2018 17:55:18 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> In adition:
>   - Add -DCPPREST_EXCLUDE_WEBSOCKETS=ON as a default CONF_OPT as websocketspp
>     is not checked as a dependency.

This commit and also a number of your other recent changes lack  your
Signed-off-by line. Could you resubmit with your SoB ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
