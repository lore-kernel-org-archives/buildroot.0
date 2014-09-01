From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Sep 2014 12:11:29 +0000 (UTC)
Subject: [Buildroot] [Bug 7346] [2014.08rc3] vim-8ae50e3ef8bf.tar.gz can not
 be downloaded, 404 not found
In-Reply-To: <bug-7346-163@https.bugs.busybox.net/>
References: <bug-7346-163@https.bugs.busybox.net/>
Message-ID: <20140901121129.E30059D573@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7346

--- Comment #3 from joymarquis at hotmail.com 2014-09-01 12:11:29 UTC ---
Hi all,

Thanks for all of your quick comments and feedback.

What Thomas mentioned is exact what I'm encountered: I was trying this build
within a uncontrolled firewall which does not allow "Mercurial port".

According to Peter's solution: I tried downloading the vim-*** to "dl/" folder
and "make", the buildroot was finished successfully.

I'll to delete the dl/vim-*** package and try if Peter's solution is working.

Will update once completed.


Thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
