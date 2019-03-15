From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 22:01:08 +0100
Subject: [Buildroot] [PATCH v8 2/3] package/openjdk: package/openjdk:
 Add AArch64 support
In-Reply-To: <20190315205233.128763-2-aduskett@gmail.com>
References: <20190315205233.128763-1-aduskett@gmail.com>
 <20190315205233.128763-2-aduskett@gmail.com>
Message-ID: <20190315220108.1f715b20@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Mar 2019 16:52:32 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> OpenJDK has CPU ports for the AArch64 and ARM architectures.
> Add support for AArch64 as the first.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I am still confused by what happens on AArch64 if I only apply PATCH
1/3 in this series, but not PATCH 2/3.

Shouldn't PATCH 1/3 restrict package/openjdk to the set of
known-working architectures ? Is there some architecture specific code
in openjdk that would make it available only on a subset of the
architectures we support ?

Thanks

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
