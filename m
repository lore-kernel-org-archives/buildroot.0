From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Oct 2014 21:08:40 +0000 (UTC)
Subject: [Buildroot] [Bug 7142] ecryptfs needs getent to run
In-Reply-To: <bug-7142-163@https.bugs.busybox.net/>
References: <bug-7142-163@https.bugs.busybox.net/>
Message-ID: <20141020210840.CCACCAFFCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7142

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-20 21:08:40 UTC ---
getent support was merged in
http://git.buildroot.net/buildroot/commit/package/getent?id=db4919bcac12ff9d2383dd6c69e3042e0658247a
and
http://git.buildroot.net/buildroot/commit/package/ecryptfs-utils?id=66215ffc6d711840180ad1fdba1548d037c05bdf.
Bug is fixed.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
