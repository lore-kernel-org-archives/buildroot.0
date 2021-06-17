From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 17 Jun 2021 02:32:20 +0000
Subject: [Buildroot] [Bug 13661] host-python2 build fails on aarch64
In-Reply-To: <bug-13661-163@https.bugs.busybox.net/>
References: <bug-13661-163@https.bugs.busybox.net/>
Message-ID: <bug-13661-163-BSRs8M1ItA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13661

Christian Stewart <christian@paral.in> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |---

--- Comment #2 from Christian Stewart <christian@paral.in> ---
https://github.com/skiffos/SkiffOS/issues/142

According to some users attempting to build with Arm64 machines using Ubuntu as
the host (for Buildroot) against latest 2021.02.3,

This issue is still present - host-python fails to build.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
