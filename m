From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Apr 2021 20:12:15 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-lYt7dFQ59U@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #2 from Arnout Vandecappelle <arnout@mind.be> ---
I just built the defconfig in attachment, and /usr/sbin/dhcpd is in fact
installed.

Perhaps your post-build script removes it? Or one of your custom packages?


> Actual Results:
>  file "build/target/usr/sbin/dhcpd2", "./usr/sbin/dhcpd2" in "build/images/rootfs.tar" not exist

The file is dhcpd, not dhcpd2.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
