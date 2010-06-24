From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 10:23:59 +0000 (UTC)
Subject: [Buildroot] [Bug 2095] make gconfig: undefined reference to symbol
 'dlsym@@GLIBC_2.2.5'
In-Reply-To: <bug-2095-163@https.bugs.busybox.net/>
References: <bug-2095-163@https.bugs.busybox.net/>
Message-ID: <20100624102359.D0BDC81975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2095

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
This patch is also in the mainline kernel, at
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=cbab05f041a4cff6ca15856bdd35238b282b64eb,
so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
