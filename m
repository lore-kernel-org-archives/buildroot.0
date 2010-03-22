From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Mar 2010 15:54:09 +0000 (UTC)
Subject: [Buildroot] [Bug 1303] Add librsync package
In-Reply-To: <bug-1303-163@https.bugs.busybox.net/>
References: <bug-1303-163@https.bugs.busybox.net/>
Message-ID: <20100322155410.080B077658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1303


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2010-03-22 15:54:09 UTC ---
Thanks, committed with minor changes.

A few comments:
- Please commit changes locally (on a seperate branch) and use git format-patch
to generate the patch so I can just git-am it
- You need to specify the dependencies in Config.in as well
- sourceforge workaround not needed, see other packages (like haserl) how the
direct download URL is used


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
