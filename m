From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:17:02 +0200
Subject: [Buildroot] [PATCH] gpsd: PPS feature depends on NTPSHM feature
In-Reply-To: <1343632940-8604-1-git-send-email-spdawson@gmail.com>
References: <1343632940-8604-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120730191702.30a566d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Jul 2012 08:22:20 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> The PPS feature of gpsd depends on the NTP shared memory time hinting feature.
> 
> This patch caused the NTPSHM feature to be enabled whenever the PPS feature
> is enabled. This should fix build failures such as the following.
> 
>   http://autobuild.buildroot.net/results/e58a9a9f884acb6834a8afe4a8a3d056dc509359/build-end.log
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
