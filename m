From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Apr 2015 13:04:00 +0000 (UTC)
Subject: [Buildroot] [Bug 7956] glibc 2.20 and 2.21 fail to build for
 sh64-buildroot-linux-gnu
In-Reply-To: <bug-7956-163@https.bugs.busybox.net/>
References: <bug-7956-163@https.bugs.busybox.net/>
Message-ID: <20150409130400.08E33817EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7956

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-09 13:03:59 UTC ---
Do you actually use/need sh64 support? We're thinking of removing/deprecating
it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
