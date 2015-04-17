From: Santhosh Ramani <srcoolz@gmail.com>
Date: Fri, 17 Apr 2015 11:37:41 -0500
Subject: [Buildroot] Run a custom script after USB mount
In-Reply-To: <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
References: <CADKZYYKSc+rE2YvaBokFteSTE3gwnEvNksY1-w0HNC35u5yFig@mail.gmail.com>
 <CAKAx1ch+bA0RtZ6tfeK959UQazCaWRtRZr_N-DKBdGddXvK9Fg@mail.gmail.com>
Message-ID: <CADKZYYLY_bj7b-8vJ+ztgxc2zjuxKLJgxAJ0e4XY681=h2aj=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lionel,


have you checked that you are actually using the udev system, and not
> mdev for example ?
> As an aside note, I do the same using mdev and it works perfectly, so
> I could get rid of udev and make my system lighter.


I checked the daemons that are running, and it seems udev is running.
However, I do see /sbin/mdev and /sbin/udevd, so not entirely sure which
one is running. Under System Configuration /dev management, I do have eudev
selected rather than mdev.

But regardless, shouldn't the script execute when USB is detected. I see
that it gets mounted properly at /media/usb0 but the script doesn't seem to
run.

Thanks once again for your reply.
Regards

Santhosh

-- 
Greater the Difficulty....Sweeter is the Victory
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150417/7206b452/attachment.html>
