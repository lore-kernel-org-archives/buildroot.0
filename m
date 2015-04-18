From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 14:36:54 +0200
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
 <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
Message-ID: <20150418143654.021fa104@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Santhosh Ramani,

On Fri, 17 Apr 2015 11:37:41 -0500, Santhosh Ramani wrote:

> I checked the daemons that are running, and it seems udev is running.
> However, I do see /sbin/mdev and /sbin/udevd, so not entirely sure which
> one is running. Under System Configuration /dev management, I do have eudev
> selected rather than mdev.
> 
> But regardless, shouldn't the script execute when USB is detected. I see
> that it gets mounted properly at /media/usb0 but the script doesn't seem to
> run.

You may want to try 'udevadm --monitor' or something similar to debug
the udev events.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
