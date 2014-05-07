From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  7 May 2014 17:15:52 +0000 (UTC)
Subject: [Buildroot] [Bug 7010] jamvm builds and runs fine under mips (be)
In-Reply-To: <bug-7010-163@https.bugs.busybox.net/>
References: <bug-7010-163@https.bugs.busybox.net/>
Message-ID: <20140507171552.1C90A9CAFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7010

--- Comment #2 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-05-07 17:15:51 UTC ---
It seems that a development tree of jamvm is available containing mips(be)
support already. This tree is supposed to become version 1.6.0 of jamvm, but it
seems that no release has been made for a long time now.

See the tree at http://developer.berlios.de/git/?group_id=6545

One solution would be to accept Alexander's patch as is, the other one being to
switch to a git revision.

In the mean time I will contact the jamvm team with request for an update on
1.6.0.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
