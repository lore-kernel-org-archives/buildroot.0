From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 21:32:42 +0200
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove
 board/friendlyarm/nanopi-m4
In-Reply-To: <20200421171258.1893120-1-aduskett@gmail.com>
References: <20200421171258.1893120-1-aduskett@gmail.com>
Message-ID: <20200421213242.029a6ca5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 21 Apr 2020 10:12:58 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> When running get-developers the following warning is shown:
> WARNING: 'board/friendlyarm/nanopi-m4/' doesn't match any file
> 
> This defconfig was removed with commit a24bd8936f57a590f810e14d7828cf1bddce580e
> which was on August 29th of 2019.

This is not what happened. This line was added much more recently, in
commit 84ba2e8bf5f1e3a9d0d01a577f72cfd51f88a7b6, but it had a typo: it
should have pointed to board/friendlyarm/nanopi-neo4/. So instead I
fixed the typo.

Thanks for noticing!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
