From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Oct 2014 19:02:41 +0000 (UTC)
Subject: [Buildroot] [Bug 7088] elfutils on Blackfin doesn't build
In-Reply-To: <bug-7088-163@https.bugs.busybox.net/>
References: <bug-7088-163@https.bugs.busybox.net/>
Message-ID: <20141020190241.2E6E6AFDCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7088

--- Comment #4 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-10-20 19:02:40 UTC ---
(In reply to comment #3)
> there is no Blackfin backend in elfutils, so it isn't terribly useful ...

This seems a true statement: 
https://git.fedorahosted.org/cgit/elfutils.git/tree/backends

So maybe it's better to reject this bug?

Thomas Petazzoni, since you opened the bug, what is your opinion?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
