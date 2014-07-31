From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Jul 2014 10:37:55 +0000 (UTC)
Subject: [Buildroot] [Bug 7286] systemd 215 doesn't build
In-Reply-To: <bug-7286-163@https.bugs.busybox.net/>
References: <bug-7286-163@https.bugs.busybox.net/>
Message-ID: <20140731103755.AD6839D357@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7286

--- Comment #3 from nroach44 at gmail.com 2014-07-31 10:37:55 UTC ---
Testing using the defconfig: Setting glibc and systemd and then -O{1,2,3} (not
-O{s,1}), I get build errors very similar (probably the same but jumbled due to
multithreading).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
