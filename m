From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Apr 2014 18:40:52 +0000 (UTC)
Subject: [Buildroot] [Bug 6950] Full unicode support in ncurses
In-Reply-To: <bug-6950-163@https.bugs.busybox.net/>
References: <bug-6950-163@https.bugs.busybox.net/>
Message-ID: <20140429184052.9F0F89CA66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6950

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-04-29 18:40:52 UTC ---
Patches for ncurses wide support have been proposed before, last version by
Jeremy Kerr: http://patchwork.ozlabs.org/patch/329289/

The topic has been discussed here too:
http://lists.busybox.net/pipermail/buildroot/2013-October/080673.html

From this discussion, I don't see a blocking problem in accepting the mentioned
patch. There was some debate about the fact that ncurses allows to either build
non-widechar, or widechar, but not both at the same time.
In Jeremy's patch, the user has to choose which one he wants.

An alternative solution was to create two separate packages: ncurses and
ncursesw.

So according to me, we either accept Jeremy's patch (possible refreshed) or
someone should implement the split package approach.

Input?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
