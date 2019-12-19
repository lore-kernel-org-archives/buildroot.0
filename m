From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Dec 2019 21:44:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/openrc: install sysv-rcs file
In-Reply-To: <20191219190135.7013-1-aduskett@gmail.com>
References: <20191219190135.7013-1-aduskett@gmail.com>
Message-ID: <20191219214429.757aff57@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 19 Dec 2019 11:01:35 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <aduskett@greenlots.com>
> 
> package/openrc has the file sysv-rcs which starts sysvinit services
> not written for openrc. However, currently it is not installed to
> the target.
> 
> Install this file to $(TARGET_DIR)/etc/init.d during the
> target_install step.
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>

Michal had what seems like a more elaborate solution:

  http://patchwork.ozlabs.org/patch/1098590/

Michal, could you comment ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
