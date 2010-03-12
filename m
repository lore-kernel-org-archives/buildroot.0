From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Mar 2010 18:21:04 +0000 (UTC)
Subject: [Buildroot] [Bug 849] "customize" package copies files to wrong
 place in target tree
In-Reply-To: <bug-849-163@https.bugs.busybox.net/>
References: <bug-849-163@https.bugs.busybox.net/>
Message-ID: <20100312182104.73FAF764C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=849





--- Comment #2 from Grant Edwards <grant.b.edwards@gmail.com>  2010-03-12 18:21:03 UTC ---
(In reply to comment #1)

> Wrong. Then it will copy wrongly files that needs new directory to be
> created. I think we should use install instead of cp.

Can you provide an example where it fails?

I tested the patch pretty extensively and it worked fine for me - when
new directories needed to be created.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
