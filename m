From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Jul 2010 07:27:52 +0000 (UTC)
Subject: [Buildroot] [Bug 2149] xterm build failure
In-Reply-To: <bug-2149-163@https.bugs.busybox.net/>
References: <bug-2149-163@https.bugs.busybox.net/>
Message-ID: <20100701072752.DEF2A8188F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2149

--- Comment #3 from Mitch Davis <mjd-busybox.net@afork.com>  ---
I looked at the attached patch.  Does UCLIBC_HAS_GETPT need to have an entry in
the menuconfig?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
