From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Aug 2020 19:23:29 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-iIpM1feOhQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #15 from Peter Seiderer <ps.report@gmx.net> ---
Fix/workaround posted upstream, see [1].

[1] https://github.com/pengutronix/genimage/pull/116

-- 
You are receiving this mail because:
You are on the CC list for the bug.
