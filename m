From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  6 Oct 2014 22:15:21 +0000 (UTC)
Subject: [Buildroot] [Bug 7520] CodeSourcery toolchain ARM: C++11
 std::exception_ptr is not available for Cortex-A9 if thumb2 is not
 selected.
In-Reply-To: <bug-7520-163@https.bugs.busybox.net/>
References: <bug-7520-163@https.bugs.busybox.net/>
Message-ID: <20141006221521.98339B0A9F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7520

--- Comment #1 from romain.naour at openwide.fr 2014-10-06 22:15:21 UTC ---
Created attachment 5726
  --> https://bugs.busybox.net/attachment.cgi?id=5726
C++11 test program

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
