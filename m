From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Apr 2010 19:58:13 +0000 (UTC)
Subject: [Buildroot] [Bug 1093] [PATCH] Upgrade libusb to v1.0.3 and add new
 libusb-compat package for compatibility with old packages that expect the
 pre-1.0 API.
In-Reply-To: <bug-1093-163@https.bugs.busybox.net/>
References: <bug-1093-163@https.bugs.busybox.net/>
Message-ID: <20100406195813.2FA888DC0F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1093





--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-04-06 19:58:12 UTC ---
Should be handled by the merge of
http://lists.busybox.net/pipermail/buildroot/2010-April/033242.html. Peter,
could you please close this bug when the branch will be merged ? Thanks!

Thanks Mike for working on this patch. It seems that usb_modeswitch is
available as a newer version (1.1.1), but this version only contains the
variant of usb_modeswitch that relies on udev and tcl. Do you have any interest
in this version ?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
