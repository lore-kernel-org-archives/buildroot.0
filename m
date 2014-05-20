From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 May 2014 12:11:07 +0000 (UTC)
Subject: [Buildroot] [Bug 7088] elfutils on Blackfin doesn't build
In-Reply-To: <bug-7088-163@https.bugs.busybox.net/>
References: <bug-7088-163@https.bugs.busybox.net/>
Message-ID: <20140520121107.C2A299CB24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7088

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
   Target Milestone|---                         |2014.08

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-05-20 12:11:07 UTC ---
FWIW, in 2014.05, this bug was worked around by disabling the elfutils package
on Blackfin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
