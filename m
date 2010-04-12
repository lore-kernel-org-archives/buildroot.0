From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Apr 2010 14:58:35 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] xfont_font-adobe-100dpi does not build
In-Reply-To: <bug-1399-163@https.bugs.busybox.net/>
References: <bug-1399-163@https.bugs.busybox.net/>
Message-ID: <20100412145835.B21F920CE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399





--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-04-12 14:58:35 UTC ---
Anyway, Buildroot should *not* rely on xfont-utils to be installed on the host
distribution, but should rather build it for the host.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
