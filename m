From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 31 Jan 2012 22:21:06 +0000 (UTC)
Subject: [Buildroot] [Bug 4303] Toolchains qmake causes DEBUG builds with -O2
In-Reply-To: <bug-4303-163@https.bugs.busybox.net/>
References: <bug-4303-163@https.bugs.busybox.net/>
Message-ID: <20120131222106.17A7C9095D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4303

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-01-31 22:21:05 UTC ---
Why should we make a special case for Qt here ? If you tell Buildroot to use
-O2, then it sounds quite logical to have -O2 in the qmake CXXFLAGS, no ? If
you don't want -O2 in the qmake CXXFLAGS, then tell Buildroot to not use -O2,
and you're all set.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
