From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 06 Jun 2018 19:16:40 +0000
Subject: [Buildroot] [Bug 9921] lockfile module within python-daemon not
 available
In-Reply-To: <bug-9921-163@https.bugs.busybox.net/>
References: <bug-9921-163@https.bugs.busybox.net/>
Message-ID: <bug-9921-163-gLH4VEQDqw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9921

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
I'm closing this bug, because:

 - The runner functionality in the python-daemon project is deprecated

 - The python-lockfile project is deprecated too, and known to be broken

So there is no good way to fix this problem.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
