From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2020 12:23:57 +0000
Subject: [Buildroot] [Bug 12826] nodejs-12.16.1: error: 'uv_sleep' was not
 declared in this scope
In-Reply-To: <bug-12826-163@https.bugs.busybox.net/>
References: <bug-12826-163@https.bugs.busybox.net/>
Message-ID: <bug-12826-163-8JPLPUR4D6@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12826

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. Is this with Buildroot master? Are you after commit
7d9ed0a19d8e88b56b389187c38b44563e33e5ab ? If so, could you revert
7d9ed0a19d8e88b56b389187c38b44563e33e5ab and try again ? Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
