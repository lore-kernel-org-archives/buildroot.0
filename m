From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 08:00:12 +0000 (UTC)
Subject: [Buildroot] [Bug 381] libtheora not using sdl-prefix
In-Reply-To: <bug-381-163@https.bugs.busybox.net/>
References: <bug-381-163@https.bugs.busybox.net/>
Message-ID: <20090831080012.6A5DA7773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=381





--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-31 08:00:10 UTC ---
(In reply to comment #3)
> I also cannot reproduce it in mipsel either. The reason why I tries x86 was
> that this is normally the situation where packages gets confused and link with
> system libs.

Have you been able to reproduce this? 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
