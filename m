From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Nov 2011 23:53:13 +0000 (UTC)
Subject: [Buildroot] [Bug 4021] uClibc: undefined reference to
	`__GI___errno_location'
In-Reply-To: <bug-4021-163@https.bugs.busybox.net/>
References: <bug-4021-163@https.bugs.busybox.net/>
Message-ID: <20111107235313.DE5568F4A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4021

--- Comment #4 from Kevin Robbins <Robbins.Kevin.D@gmail.com> 2011-11-07 23:53:13 UTC ---
I can confirm that this bug remains in both current head and 2011.08. I, too,
am building for a LEON3 SPARC v8 processor with a hardware FPU. uLibc fails in
just the same way for versions 0.9.31, 0.9.32, and today's daily snapshot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
