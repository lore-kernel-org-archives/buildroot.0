From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Feb 2017 14:14:16 +0100
Subject: [Buildroot] [PATCH] tslib: bump to 1.4
In-Reply-To: <1486122318-17699-1-git-send-email-martin.kepplinger@ginzinger.com>
References: <1486122318-17699-1-git-send-email-martin.kepplinger@ginzinger.com>
Message-ID: <20170203141416.4b41aff7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 3 Feb 2017 12:45:18 +0100, Martin Kepplinger wrote:

This patch lacks your Signed-off-by line, so we unfortunately cannot
apply it. Would you mind adding your Signed-off-by line?

> Older kernel headers than 3.12 should be supported again, but I didn't run
> tests, so I kept it in Config.in; just so you know in case you want to try.

You can check whether it builds on a kernel older than 3.12 by using
the following toolchain configuration:

  http://autobuild.buildroot.net/toolchains/configs/br-arm-full.config

This one uses the 3.10 kernel headers.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
