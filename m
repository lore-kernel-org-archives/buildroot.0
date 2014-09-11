From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Sep 2014 21:38:24 +0000 (UTC)
Subject: [Buildroot] [Bug 7424] undefined reference to
	`__builtin_thread_pointer'
In-Reply-To: <bug-7424-163@https.bugs.busybox.net/>
References: <bug-7424-163@https.bugs.busybox.net/>
Message-ID: <20140911213824.EBACC9D665@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7424

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-09-11 21:38:24 UTC ---
Did you customize your uClibc configuration using "make uclibc-menuconfig" ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
