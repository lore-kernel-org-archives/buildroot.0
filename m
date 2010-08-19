From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 18 Aug 2010 19:43:37 -0500
Subject: [Buildroot] package/hotplug
Message-ID: <0D753D10438DA54287A00B0270842697643E62F9E6@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am trying to get USB memory stick hotplugging to work on my busybox system.  I
would like to be able to attach a memory stick and have the system auto mount the
drive.

I assumed that I would need to enable hotplug package to do this but it is normally
disabled by BR2_PACKAGE_BUSYBOX_SHOW_OTHERS.  I have looked thru the busybox
configuration and can't find anything that would replace the hotplug app.  Did I
overlook something?

Regards,
Hartley
