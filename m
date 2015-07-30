From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2015 10:10:16 +0000 (UTC)
Subject: [Buildroot] [Bug 8006] rpcdebug in nfs-utils built for the host
In-Reply-To: <bug-8006-163@https.bugs.busybox.net/>
References: <bug-8006-163@https.bugs.busybox.net/>
Message-ID: <20150730101016.AF64481E8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8006

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-30 10:10:16 UTC ---
Fixed by the latest bump of nfs-utils, see
http://git.buildroot.net/buildroot/commit/package/nfs-utils?id=e5e31fe92dd191480341d07a01f79f88abab9c2a.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
