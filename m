From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Mar 2009 10:32:43 +0000 (UTC)
Subject: [Buildroot] [Bug 175] empty filename include in wchar.h
In-Reply-To: <bug-175-163@https.bugs.busybox.net/>
References: <bug-175-163@https.bugs.busybox.net/>
Message-ID: <20090311103244.156EB7645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=175


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |DUPLICATE




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-11 10:32:43 UTC ---
This sounds similar to #71. You have to enable WCHAR support under toolchain
options. It's fixed in svn trunk.

*** This bug has been marked as a duplicate of bug 71 ***


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
