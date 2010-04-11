From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Apr 2010 22:16:02 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100411221602.1542199B79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399





--- Comment #4 from Paulius Zaleckas <paulius.zaleckas@gmail.com>  2010-04-11 22:16:01 UTC ---
(In reply to comment #2)
> Very strange... does any other font build OK?
> I suspect that it may be some utility missing on the host.

I have checked Makefile and I think it may be bdftopcf missing on your host.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
