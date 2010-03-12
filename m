From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Mar 2010 17:43:31 +0000 (UTC)
Subject: [Buildroot] [Bug 849] "customize" package copies files to wrong
 place in target tree
In-Reply-To: <bug-849-163@https.bugs.busybox.net/>
References: <bug-849-163@https.bugs.busybox.net/>
Message-ID: <20100312174331.F1B487775A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=849


Paulius Zaleckas <paulius.zaleckas@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |paulius.zaleckas at gmail.com




--- Comment #1 from Paulius Zaleckas <paulius.zaleckas@gmail.com>  2010-03-12 17:43:31 UTC ---
Wrong. Then it will copy wrongly files that needs new directory to be created.
I think we should use install instead of cp.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
