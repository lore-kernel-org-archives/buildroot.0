From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 19 Aug 2020 22:32:18 +0000
Subject: [Buildroot] [Bug 13166] python-rpi-gpio: does not work against
 aarch64, unintentional side-effect of gcc-10 patch
In-Reply-To: <bug-13166-163@https.bugs.busybox.net/>
References: <bug-13166-163@https.bugs.busybox.net/>
Message-ID: <bug-13166-163-6UWzOtFBvM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13166

--- Comment #3 from Christian Stewart <christian@paral.in> ---
Here's a patch to fix it by going back to the "disable compiler warning and
paper over the problem" approach, not sure if the maintainers will like it, but
at least it fixed the problem for me in the short term.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
