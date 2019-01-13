From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:30:24 +0100
Subject: [Buildroot] [PATCH v2] syslog-ng: depend on !BR2_STATIC_LIBS
In-Reply-To: <20190113084722.19441-1-judge.packham@gmail.com>
References: <20190113084722.19441-1-judge.packham@gmail.com>
Message-ID: <20190113143024.37db0f19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 21:47:22 +1300, Chris Packham wrote:
> Upstream now unconditionally requires dlfcn.h:
> - https://github.com/balabit/syslog-ng/commit/01258e56abc5804f8ea977ff9ab98cc8e2fd4702
> 
> Fixes:
> - http://autobuild.buildroot.net/results/c0bca852e053cd0e021205b3a949e750ae602333
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
> Changes in v2:
> - update comment when toolchain prerequisites are not met (thanks Baruch)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
