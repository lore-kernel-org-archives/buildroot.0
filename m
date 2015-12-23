From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Dec 2015 21:58:29 +0000
Subject: [Buildroot] [Bug 8571] strace for ARC compile error
In-Reply-To: <bug-8571-163@https.bugs.busybox.net/>
References: <bug-8571-163@https.bugs.busybox.net/>
Message-ID: <bug-8571-163-vYv5qdOAPK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8571

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the report. This has also been found by our autobuilders:
http://autobuild.buildroot.org/?reason=strace-4.11. I just mailed Alexey
Brodkin, who maintains the ARC support in Buildroot, to point him to this bug.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
