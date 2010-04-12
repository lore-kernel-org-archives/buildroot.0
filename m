From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2010 14:19:32 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100412141932.CEEB18DBDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399





--- Comment #7 from Paulius Zaleckas <paulius.zaleckas@gmail.com>  2010-04-12 14:19:32 UTC ---
(In reply to comment #6)
> I checked for bdftopcf on the host and it is there even without fontutils
> installed.
> 

How you checked for it?
It should output usage documentation if you just type "bdftopcf -" in terminal.
And if it really is present on your host I have no idea why buildroot fails to
compile fonts...


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
