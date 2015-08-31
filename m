From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2015 21:03:42 +0000 (UTC)
Subject: [Buildroot] [Bug 8246] X.org DRI2 build issue
In-Reply-To: <bug-8246-163@https.bugs.busybox.net/>
References: <bug-8246-163@https.bugs.busybox.net/>
Message-ID: <20150831210342.8F1CE81D6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8246

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-31 21:03:42 UTC ---
This bug is fixed in master now, probably thanks to the DRI related fixes made
by Bernd. The same defconfig builds fine with today's master. Closing.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
