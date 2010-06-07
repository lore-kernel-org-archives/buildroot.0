From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 10:27:48 +0000 (UTC)
Subject: [Buildroot] [Bug 1807] LZMA 4.32.7,
	Required header file(s) are missing.
In-Reply-To: <bug-1807-163@https.bugs.busybox.net/>
References: <bug-1807-163@https.bugs.busybox.net/>
Message-ID: <20100607102748.DEEFA8B68D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1807

--- Comment #5 from Peter Katzmann <peter.katzmann@edag.de>  ---
Problem was, as guessed, the old uclibc config.
After reworking this everything works fine

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
