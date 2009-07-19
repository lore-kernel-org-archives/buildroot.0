From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 19 Jul 2009 21:17:20 +0000 (UTC)
Subject: [Buildroot] [Bug 381] libtheora not using sdl-prefix
In-Reply-To: <bug-381-163@https.bugs.busybox.net/>
References: <bug-381-163@https.bugs.busybox.net/>
Message-ID: <20090719211720.DEA8D777F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=381





--- Comment #2 from Evan Zelkowitz <evan.zelkowitz@gmail.com>  2009-07-19 21:17:19 UTC ---
I will try to reproduce again.  I was building for mipsel on an x86 box and it
ended up linking against the sdl in the box's local /usr/lib instead of the one
in the buildroot directory, thats why I added the sdl-prefix so it would look
at the buildroot one.  Since I was building for mipsel it was pretty apparent
when things werent built correctly since they would fail on linking.  Since you
were doing an x86 toolchain on an x86 box that may be why you couldnt see it.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
