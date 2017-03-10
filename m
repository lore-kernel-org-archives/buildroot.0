From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Mar 2017 12:21:55 +0000
Subject: [Buildroot] [Bug 9721] version 2017.02: no acceptable m4 could be
	found in $PATH
In-Reply-To: <bug-9721-163@https.bugs.busybox.net/>
References: <bug-9721-163@https.bugs.busybox.net/>
Message-ID: <bug-9721-163-Y1EnJt0pnX@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9721

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Can you check in output/build/host-libtool-2.4.6/config.log to see why the m4
check fails?

I'm using m4 1.4.18 here without issues.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
