From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Mar 2009 16:14:24 +0000 (UTC)
Subject: [Buildroot] [Bug 163] Xtensa architecture port
In-Reply-To: <bug-163-163@https.bugs.busybox.net/>
References: <bug-163-163@https.bugs.busybox.net/>
Message-ID: <20090310161424.6AEC376203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=163





--- Comment #3 from Bernhard <rep.dot.nop@gmail.com>  2009-03-10 16:14:23 UTC ---
First, there are superfluous trailing ';' chars in your patch.

Does this:
+       uncomp="tar cf - --exclude=.svn --no-anchored -C";
work with busybox's tar?

What is "uparm" ment to be? Please use a more descriptive name.

Last, can you give some examples that show why you need these changes?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
