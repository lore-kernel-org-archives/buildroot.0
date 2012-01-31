From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 22:50:47 +0000 (UTC)
Subject: [Buildroot] [Bug 3703] Consider using /usr/bin/env bash in scripts
In-Reply-To: <bug-3703-163@https.bugs.busybox.net/>
References: <bug-3703-163@https.bugs.busybox.net/>
Message-ID: <20120131225047.5243A90962@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3703

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 22:50:47 UTC ---
Not sure what to do with those FreeBSD-specific changes. I am not sure we want
to support FreeBSD as a build host, since nobody is actively working on this.
If someone is interested, please send the corresponding patches on the mailing
list. There has been no activity on this FreeBSD topic since may 2011, so I
suspect there simply isn't enough interested people.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
