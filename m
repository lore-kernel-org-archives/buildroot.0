From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Nov 2014 08:28:57 +0000 (UTC)
Subject: [Buildroot] [Bug 7646] strftime on datetime not works on python3.
In-Reply-To: <bug-7646-163@https.bugs.busybox.net/>
References: <bug-7646-163@https.bugs.busybox.net/>
Message-ID: <20141114082857.0FA9DACD48@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7646

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #13 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-11-14 08:28:56 UTC ---
Patch work-arounding the problem for Python 3 has been applied, see
http://git.buildroot.net/buildroot/commit/?id=5ad4ac083276b3504889c39351a56d947f172b5f.

The same problem can occur with other packages, but unfortunately, there's not
much we can do at this point, except waiting for the uClibc folks to react.

Since the original problem related to Python 3 is now fixed, I'm closing this
bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
