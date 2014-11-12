From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Nov 2014 22:33:00 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141112223300.8BBAEB1295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-12 22:33:00 UTC ---
Another data point is that it breaks with uClibc (at least the toolchain at
http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2014.08.tar.bz2),
but works with glibc (CodeSourcery ARM 2014.05).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
