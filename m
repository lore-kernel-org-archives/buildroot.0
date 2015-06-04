From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 15:15:44 +0000 (UTC)
Subject: [Buildroot] [Bug 7592] Buildroot GCC: -lto requires plugin support
	in ranlib
In-Reply-To: <bug-7592-163@https.bugs.busybox.net/>
References: <bug-7592-163@https.bugs.busybox.net/>
Message-ID: <20150604151544.BBC4480425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7592

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-06-04 15:15:44 UTC ---
This has actually been fixed a long time ago, in commit
814f63ec32585f281855587fe0a287cee32e4232, which adds LTO support. It makes sure
the wrapper is not generated for tools that shouldn't be wrapped.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
