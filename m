From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jul 2012 22:20:13 +0200
Subject: [Buildroot] [PATCH] udev: process udev events on startup in
 init.d script
In-Reply-To: <1343397838-2265-1-git-send-email-net147@gmail.com>
References: <1343397838-2265-1-git-send-email-net147@gmail.com>
Message-ID: <20120730222013.695840fc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 28 Jul 2012 00:03:58 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> udev rules are not processed for kernel events that occur before
> the udev daemon is started. Call udevadm trigger to replay these
> missed events.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
