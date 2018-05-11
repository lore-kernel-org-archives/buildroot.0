From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 May 2018 15:53:19 +0000
Subject: [Buildroot] [Bug 10996] bogus musl ARM toolchain
In-Reply-To: <bug-10996-163@https.bugs.busybox.net/>
References: <bug-10996-163@https.bugs.busybox.net/>
Message-ID: <bug-10996-163-AvM7TV3Ei1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10996

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
After discussing with the musl maintainers, this happens because we don't pass
-static. However, a similar setup works with uClibc.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
