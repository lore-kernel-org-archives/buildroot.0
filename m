From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Apr 2015 13:09:54 +0000 (UTC)
Subject: [Buildroot] [Bug 7676] Package procps-ng installs binaries to
 nonsensical folder.
In-Reply-To: <bug-7676-163@https.bugs.busybox.net/>
References: <bug-7676-163@https.bugs.busybox.net/>
Message-ID: <20150409130954.902CC819BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7676

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-04-09 13:09:54 UTC ---
This was fixed by commit 8b33a9531c4e64a53bfe9fbd59ef454ebd5128e3.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
