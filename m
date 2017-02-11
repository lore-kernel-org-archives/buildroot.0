From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Feb 2017 14:39:29 +0000
Subject: [Buildroot] [Bug 8946] Valgrind fails to build with stack
	protection turned on
In-Reply-To: <bug-8946-163@https.bugs.busybox.net/>
References: <bug-8946-163@https.bugs.busybox.net/>
Message-ID: <bug-8946-163-DwJbX6SsV8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8946

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #9 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/package/valgrind?id=994ac94c57bb422abc818674be4f9e04c8ff60ca

-- 
You are receiving this mail because:
You are on the CC list for the bug.
