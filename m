From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 10:07:45 +0000 (UTC)
Subject: [Buildroot] [Bug 2305] new package: ptpd
In-Reply-To: <bug-2305-163@https.bugs.busybox.net/>
References: <bug-2305-163@https.bugs.busybox.net/>
Message-ID: <20130526100745.3AEE19A579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2305

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 10:06:35 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/package/ptpd/Config.in?h=next&id=7d6449bb165c8708652bbc3e0373cc6d70299afe,
which will be part of the 2013.08 release.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
