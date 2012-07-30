From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 19:16:52 +0200
Subject: [Buildroot] [PATCH] gpsd: fix Python 2.5 build failure
In-Reply-To: <1343632101-7179-1-git-send-email-spdawson@gmail.com>
References: <1343632101-7179-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120730191652.562a15e2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 30 Jul 2012 08:08:21 +0100,
spdawson at gmail.com a ?crit :

> From: Simon Dawson <spdawson@gmail.com>
> 
> The platform.linux_distribution method was introduced in Python 2.6. Some
> of the Buildroot autobuilders still use Python 2.5, which is causing build
> failures such as the following.
> 
>   http://autobuild.buildroot.net/results/045f1f69bac170d8e75cb4952a2e5b4e85a677b8/build-end.log
> 
> This patch removes the linux distribution check from the gpsd SConstruct file.
> 
> Signed-off-by: Simon Dawson <spdawson@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
