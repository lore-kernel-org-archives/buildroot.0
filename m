From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  2 Mar 2010 21:50:36 +0000 (UTC)
Subject: [Buildroot] [Bug 1225] Buildroot fails to account for "nof"
 subdirectory (no floating point)
In-Reply-To: <bug-1225-163@https.bugs.busybox.net/>
References: <bug-1225-163@https.bugs.busybox.net/>
Message-ID: <20100302215036.24D1477755@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1225





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-03-02 21:50:35 UTC ---
I am not able to reproduce, with a build for PowerPC 440, BR2_SOFT_FLOAT=y. So,
something else must be different in your configuration. Could you attach your
.config ?

Note that your workaround is not very nice, since floating point emulation by
the kernel is noticably slower that emulation in userspace.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
