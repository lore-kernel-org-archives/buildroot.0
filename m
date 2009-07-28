From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jul 2009 14:20:32 +0000 (UTC)
Subject: [Buildroot] [Bug 427] webkit: Update to WebKit svn r44552.
In-Reply-To: <bug-427-163@https.bugs.busybox.net/>
References: <bug-427-163@https.bugs.busybox.net/>
Message-ID: <20090728142032.6535B777EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=427





--- Comment #4 from Will Newton <will.newton@gmail.com>  2009-07-28 14:20:31 UTC ---
(In reply to comment #3)
> Instead of the post extract hook, doesn't FOO_AUTORECONF = YES work to run
> autogen ?
> 

Not completely. WebKit also runs gtkdocize from it's autogen.sh which setting
AUTORECONF will not do.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
