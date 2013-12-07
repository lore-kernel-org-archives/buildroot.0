From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  7 Dec 2013 20:11:54 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131207201154.AEB599BF68@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #12 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-12-07 20:11:49 UTC ---
Hi Ryan, 

Just to make sure I understand you correctly: when you write "... which will
conflict with the patches you mentioned earlier" you are talking about the fact
that one of us will have to rebase his patch on top of the other one's, right?
From a functional point of view, there should be no conflict.

Thanks, 
Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
