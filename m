From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:36:38 +0100
Subject: [Buildroot] [PATCH 2/3] package/libabseil-cpp: depend on gcc >=
 4.9
In-Reply-To: <20201027174046.17157-3-buildroot@heine.tech>
References: <20201027174046.17157-1-buildroot@heine.tech>
 <20201027174046.17157-3-buildroot@heine.tech>
Message-ID: <20201029233638.78c58b98@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 27 Oct 2020 18:40:45 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> From: Michael Nosthoff <buildroot@heine.tech>
> 
> abseil depends on gcc >= 4.9
> 
> https://abseil.io/docs/cpp/platforms/platforms#linux
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Is this fixing a build issue ? If so, is this issue reported in the
autobuilders ? If it's not fixing a build issue, what is the
reason/intention behind this change ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
