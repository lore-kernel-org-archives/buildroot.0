From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 17 Feb 2012 09:37:52 +0000 (UTC)
Subject: [Buildroot] [Bug 4634] Bigendian binary is output even if it is
 configured to output little endian
In-Reply-To: <bug-4634-163@https.bugs.busybox.net/>
References: <bug-4634-163@https.bugs.busybox.net/>
Message-ID: <20120217093752.D109890AD2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4634

--- Comment #2 from Aristotelis Iordanidis <aristotelis.iordanidis@diasemi.com> 2012-02-17 09:37:52 UTC ---
Created attachment 4040
  --> https://bugs.busybox.net/attachment.cgi?id=4040
Patch to properly create symlinks when ARCH_SUBDIR is not a single directory.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
