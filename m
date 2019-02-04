From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 14:03:29 +0100
Subject: [Buildroot] [PATCH] qemu: remove host-python dependency.
In-Reply-To: <20190204124323.2865-1-aduskett@gmail.com>
References: <20190204124323.2865-1-aduskett@gmail.com>
Message-ID: <20190204140329.79858e30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please use a prefix of "package/qemu:".

On Mon,  4 Feb 2019 07:43:23 -0500
aduskett at gmail.com wrote:

> Now that BuildRoot requires python >= 2.7, qemu no longer needs a host-python,

We never use BuildRoot, but either Buildroot or buildroot. Preferably
Buildroot in such situations.

Applied with those two minor details fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
