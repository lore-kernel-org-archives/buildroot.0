From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 21 Feb 2010 18:54:53 +0000 (UTC)
Subject: [Buildroot] [Bug 829] Webkit r44552 needs libXt
In-Reply-To: <bug-829-163@https.bugs.busybox.net/>
References: <bug-829-163@https.bugs.busybox.net/>
Message-ID: <20100221185453.6B0A077762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=829





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2010-02-21 18:54:52 UTC ---
Do you still encounter this issue ? If so, could you attach your .config ?

It's fairly strange to see WebKit asking for Xt. Xt is a very old toolkit that
almost nobody uses these days.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
