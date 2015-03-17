From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 17 Mar 2015 22:20:00 +0000 (UTC)
Subject: [Buildroot] [Bug 7941] glibc-2.20 fails to build for
	sparc-buildroot-linux-gnu
In-Reply-To: <bug-7941-163@https.bugs.busybox.net/>
References: <bug-7941-163@https.bugs.busybox.net/>
Message-ID: <20150317222000.09BC681835@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7941

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-03-17 22:19:59 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=dbf7da63188d461e738dcfcaa436b84baa23143c,
which basically disallows glibc 2.20 on SPARC.

Waldemar, I noticed your proposal, but since glibc 2.21 just builds/works out
of the box on SPARC, there isn't much point in carrying a build fix for glibc
2.20.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
