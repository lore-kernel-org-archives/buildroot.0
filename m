From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Nov 2010 18:25:43 +0000 (UTC)
Subject: [Buildroot] [Bug 2845] dialog 1.1 needs libtinfo from ncurses
In-Reply-To: <bug-2845-163@https.bugs.busybox.net/>
References: <bug-2845-163@https.bugs.busybox.net/>
Message-ID: <20101125182543.C125E8CA3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2845

--- Comment #6 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #5)
> Ok, it seems to be because it ends up looking at your host headers. I've tried
> to fix that in git, could you give that a try?

It is fixed , but still don't understand why don't we have ncurses with
libtinfo , seems quite important and powerful lib ...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
