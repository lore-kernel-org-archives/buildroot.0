From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 14:14:47 +0000
Subject: [Buildroot] [Bug 9671] stunnel build error
In-Reply-To: <bug-9671-163@https.bugs.busybox.net/>
References: <bug-9671-163@https.bugs.busybox.net/>
Message-ID: <bug-9671-163-PREknU6mue@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9671

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the bug report. This has already been fixed in commit
https://git.buildroot.org/buildroot/commit/package/stunnel?id=b575baeb1ad787dac1ce31343adfd6ee3415ca41,
which will be part of the upcoming 2017.02 release.

In the mean time, you can cherry-pick this commit in your tree.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
