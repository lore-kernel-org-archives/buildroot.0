From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Feb 2014 15:02:35 +0000 (UTC)
Subject: [Buildroot] [Bug 6218] binutils-2.23.2/gas fails with undefined
 reference to `mbstowcs'
In-Reply-To: <bug-6218-163@https.bugs.busybox.net/>
References: <bug-6218-163@https.bugs.busybox.net/>
Message-ID: <20140213150235.E8A389C9E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6218

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-13 15:02:35 UTC ---
I built a toolchain based on current buildroot git (more or less 2014.02-rc1),
for arm7tdmi, using binutils-2.23.2, and did not see any problem.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
