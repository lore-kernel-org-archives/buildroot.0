From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Mar 2009 11:15:55 +0000 (UTC)
Subject: [Buildroot] [Bug 71] ./wchar.h:41:12: error: empty filename in
	#include
In-Reply-To: <bug-71-163@https.bugs.busybox.net/>
References: <bug-71-163@https.bugs.busybox.net/>
Message-ID: <20090304111555.7460A7621E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=71





--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-04 11:15:54 UTC ---
Ahh, thanks. I've fixed it so you can only select generic develop system if you
have wchar enabled in r25521.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
