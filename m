From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Apr 2010 20:09:14 +0000 (UTC)
Subject: [Buildroot] [Bug 1093] [PATCH] Upgrade libusb to v1.0.3 and add new
 libusb-compat package for compatibility with old packages that expect the
 pre-1.0 API.
In-Reply-To: <bug-1093-163@https.bugs.busybox.net/>
References: <bug-1093-163@https.bugs.busybox.net/>
Message-ID: <20100406200914.27A2B8B2C7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1093





--- Comment #3 from Mike <mac@mcrowe.com>  2010-04-06 20:09:13 UTC ---
(In reply to comment #2)
> Thanks Mike for working on this patch. It seems that usb_modeswitch is
> available as a newer version (1.1.1), but this version only contains the
> variant of usb_modeswitch that relies on udev and tcl. Do you have any interest
> in this version ?

I have no interest in usb_modeswitch at all. I just patched its makefile to
make sure that it continued to compile after the rest of my changes were
applied.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
