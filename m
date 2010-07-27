From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 22:11:10 +0000 (UTC)
Subject: [Buildroot] [Bug 1675] GMP Error during buildroot make process
In-Reply-To: <bug-1675-163@https.bugs.busybox.net/>
References: <bug-1675-163@https.bugs.busybox.net/>
Message-ID: <20100727221110.B3E8B8358A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1675

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Building GMP for the host is something that happens every time someone builds a
toolchain with Buildroot, so it's something that works, at least in the common
configurations that we test. Since the bug was reported more than two months
ago, the reporter hasn't posted the Buildroot configuration, so we have no way
of reproducing the issue.

Therefore, let's mark it as WORKSFORME. Sameer, if you can still reproduce the
issue, please reopen the bug and attach your Buildroot configuration.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
