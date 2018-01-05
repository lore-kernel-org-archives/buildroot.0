From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Jan 2018 13:11:09 +0000
Subject: [Buildroot] [Bug 10636] BR2_SYSTEM_DHCP is removed from .config and
 breaks auto eth0
In-Reply-To: <bug-10636-163@https.bugs.busybox.net/>
References: <bug-10636-163@https.bugs.busybox.net/>
Message-ID: <bug-10636-163-Ypj9tEuCyj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10636

--- Comment #1 from Patrice Blanchardie <patrice.blanchardie@gmail.com> ---
Should I stop relying on these ifup scripts and use a custom script with dhcp
client at startup, as explained in https://busybox.net/~vda/no_ifup.txt?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
