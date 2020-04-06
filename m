From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 06 Apr 2020 09:29:50 +0000
Subject: [Buildroot] [Bug 12731] rtl8188eu not buildung for banana pi M1
 (glib, systemd, 4.18.12)
In-Reply-To: <bug-12731-163@https.bugs.busybox.net/>
References: <bug-12731-163@https.bugs.busybox.net/>
Message-ID: <bug-12731-163-JTFNA5Z7zE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12731

--- Comment #1 from RAC <rac@racsoftware.com> ---
The proper solution is mentioned in the build options of the rtl8188eu - enable
WIRELESS_EXT for the kernel. So hier it is how you do it:

make linux-menuconfig - activate kernel configuration
Device Drivers \ Network device Support \ Wireless LAN \ Realtek devices

This bug can be closed, it it not a bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
