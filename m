From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 05 May 2021 19:23:40 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-mfxL5h4jph@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #4 from Arnout Vandecappelle <arnout@mind.be> ---
> Now i can't find the dhcpd-file in "build/target/usr/sbin/" or in the rootfs.tar. 
> In "build/build/dhcp-4.4.2/server" i found the file dhcpd

You did enable BR2_PACKAGE_DHCP_SERVER, right?

Which buildroot version are you using? There was a problem with installation
between Sat Apr 20 16:30:31 2019 and Thu Aug 1 18:26:09 2019 - if you happen to
use 2019.05 or 2019.05.1, you would have this problem.

I can't reproduce the issue here with your config file.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
