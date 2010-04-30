From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Apr 2010 10:05:11 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100430100511.EF2908DC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651





--- Comment #4 from Mitch Davis <mjd-busybox.net@afork.com>  2010-04-30 10:05:11 UTC ---
Interesting.  Why is the host's static version of libc needed?

(And thanks for the workaround)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
