From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue, 24 Jan 2012 15:12:25 +0100
Subject: [Buildroot] [RFC] Firmware handling in BR
Message-ID: <1327414346-12587-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So I made the first attempt to add binary firmware images to BR. I placed the stuff under "Hardware handling" in the configuration menu, but I think it would be better to place this menu direct under "Package selection for the target".

Some more issues:

1. at the time firmware script creates /lib/firmware folder itself: should it be included in skeleton?
2. /lib/firmware will be used by firmware package and by udev at build/config time: should we introduce a env variable for this?

Regards,
Yegor
