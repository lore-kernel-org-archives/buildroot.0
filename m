From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 21:01:43 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20141026210143.07309AD052@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #10 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-26 21:01:42 UTC ---
I confirm, re-enabling TLS support makes the build success.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
