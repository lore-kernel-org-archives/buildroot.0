From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Nov 2012 22:32:38 +0000 (UTC)
Subject: [Buildroot] [Bug 5666] Fails to build python 2.7.2 for 2440 arm
In-Reply-To: <bug-5666-163@https.bugs.busybox.net/>
References: <bug-5666-163@https.bugs.busybox.net/>
Message-ID: <20121112223238.7D78A99E6B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5666

--- Comment #4 from hardcorefs <hardcore@hardcoreforensics.com> 2012-11-12 22:32:37 UTC ---
HI,
Yep you are indeed a fortune teller........
Did "make clean all" and it did solve the problem, just it extends the build
time every time.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
