From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 29 Jan 2011 08:54:42 +0000 (UTC)
Subject: [Buildroot] [Bug 3169] python patch has typo,
	aborts build in scenario
In-Reply-To: <bug-3169-163@https.bugs.busybox.net/>
References: <bug-3169-163@https.bugs.busybox.net/>
Message-ID: <20110129085442.1898F8E0DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3169

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Indeed this was a mistake in the patch, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Just curious: how did you trigger the case where PYTHON_MODULES_LIB is not set
? In Buildroot, for both the host and target python, PYTHON_MODULES_LIB is
passed in the environment (which is why I didn't see the problem).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
