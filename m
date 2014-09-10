From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 10 Sep 2014 20:19:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20140910201933.E7B8C9D63F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #5 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-09-10 20:19:33 UTC ---
We need the ".config" file, not Config.in which is a part of buildroot itself.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
