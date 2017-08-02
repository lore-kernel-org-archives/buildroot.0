From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 02 Aug 2017 15:06:52 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-2LTMOcWsCn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

--- Comment #1 from clayton.shotwell at rockwellcollins.com ---
Forgot to mention what is printed when the error occurs. I see the following
printed from mksquashfs. The error code changes often and so does the file it
failed on. It only happens about 10% of the time on the servers I am running
on.

llistxattr for [file] failed in read_attrs, because Unknown error 810343192

-- 
You are receiving this mail because:
You are on the CC list for the bug.
