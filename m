From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Mar 2020 22:43:15 +0100
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to v12.16.1
In-Reply-To: <20200303191133.10404-1-aduskett@gmail.com>
References: <20200303191133.10404-1-aduskett@gmail.com>
Message-ID: <20200303224315.2237b29c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Tue,  3 Mar 2020 11:11:33 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Tested on Debian 9 and Ubuntu 18.04
> 
> Fixes:
> http://autobuild.buildroot.net/results/9d3545a76c4f5c06debf319687498d662a53fafb
> http://autobuild.buildroot.net/results/4da6c695b8ceca0a6eee2481a1b873a46676d0f5

Are you positive that this bump fixes the ICU issues? I.e did you
reproduce the ICU issues before this version bump, and confirm they
disappeared solely because of the version bump?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
