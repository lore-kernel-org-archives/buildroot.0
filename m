From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Apr 2010 05:44:19 +0000 (UTC)
Subject: [Buildroot] [Bug 1489] radvd update to 1.6
In-Reply-To: <bug-1489-163@https.bugs.busybox.net/>
References: <bug-1489-163@https.bugs.busybox.net/>
Message-ID: <20100406054419.DD0058B681@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1489


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-04-06 05:44:18 UTC ---
Thanks, committed. The install changed is wrong though (it doesn't install the
binaries anymore), so I skipped that hunk.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
