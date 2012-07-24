From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 22:48:19 +0200
Subject: [Buildroot] [PATCH] gpsd: remove timing configuration option
In-Reply-To: <1343160239-18430-1-git-send-email-spdawson@gmail.com>
References: <1343160239-18430-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120724224819.420d8352@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 24 Jul 2012 21:03:59 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> When gpsd is built with RECONFIGURE_ENABLE disabled, the min_cycle
> field of the gps_type_t field does not exist, but the code still uses
> it if TIMING_ENABLE is enabled.
> 
> This can be seen in the following test build failure.
> 
>   http://autobuild.buildroot.org/results/dd01fa0220bfd3a8aabcc85d89d624afeeda757b/build-end.log
> 
> This patch removes the configuration option that, ultimately, drives
> TIMING_ENABLE.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Oops, sorry, I had done and applied a similar in the mean time.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
