From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 07 May 2021 09:59:02 +0000
Subject: [Buildroot] [Bug 13781] isc dhcp-server package don't create file
 /usr/bin/dhcpd
In-Reply-To: <bug-13781-163@https.bugs.busybox.net/>
References: <bug-13781-163@https.bugs.busybox.net/>
Message-ID: <bug-13781-163-IxE8U4TcDC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13781

--- Comment #10 from Heiko Thiery <heiko.thiery@gmail.com> ---
This is a bug in buildroot since there is a missing dependency to host-gawk.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
