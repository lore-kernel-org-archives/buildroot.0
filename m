From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Nov 2009 17:33:07 +0000 (UTC)
Subject: [Buildroot] [Bug 701] make install problem with unstripped binaries
In-Reply-To: <bug-701-163@https.bugs.busybox.net/>
References: <bug-701-163@https.bugs.busybox.net/>
Message-ID: <20091110173307.CD2CE77704@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=701





--- Comment #3 from Lionel Landwerlin <llandwerlin@gmail.com>  2009-11-10 17:33:07 UTC ---
Well... my fix just does not work.

but replacing 

TARGET_STRIP=true -Not_stripping

by

TARGET_STRIP=true Not_stripping

seems to fix the problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
