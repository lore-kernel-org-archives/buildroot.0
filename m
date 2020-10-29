From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Oct 2020 23:37:23 +0100
Subject: [Buildroot] [PATCH 3/3] package/grpc: raise (host) gcc
 dependency to 4.9
In-Reply-To: <20201027174046.17157-4-buildroot@heine.tech>
References: <20201027174046.17157-1-buildroot@heine.tech>
 <20201027174046.17157-4-buildroot@heine.tech>
Message-ID: <20201029233723.28bc17d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Oct 2020 18:40:46 +0100
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> From: Michael Nosthoff <buildroot@heine.tech>
> 
> (host-)libabseil-cpp depends on gcc >= 4.9
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

This must be squashed into PATCH 2/3: as soon as libabseil gains new
"depends on", those "depends on" *must* be propagated to anything that
has a "select BR2_PACKAGE_LIBABSEIL_CPP".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
