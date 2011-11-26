From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Nov 2011 20:46:52 +0000 (UTC)
Subject: [Buildroot] [Bug 4484] libstdc++ has _GLIBCXX_HAVE_FENV_H undefined
 but uclibc appears to have a fenv.h
In-Reply-To: <bug-4484-163@https.bugs.busybox.net/>
References: <bug-4484-163@https.bugs.busybox.net/>
Message-ID: <20111126204652.AA3698F6CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4484

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2011-11-26 20:46:52 UTC ---
On what arch is this? uClibc currently only has basic fenv support for i386

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
