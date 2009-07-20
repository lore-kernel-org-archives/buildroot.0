From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Jul 2009 05:57:11 +0000 (UTC)
Subject: [Buildroot] [Bug 381] libtheora not using sdl-prefix
In-Reply-To: <bug-381-163@https.bugs.busybox.net/>
References: <bug-381-163@https.bugs.busybox.net/>
Message-ID: <20090720055711.E2502777E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=381





--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-20 05:57:07 UTC ---
I also cannot reproduce it in mipsel either. The reason why I tries x86 was
that this is normally the situation where packages gets confused and link with
system libs.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
