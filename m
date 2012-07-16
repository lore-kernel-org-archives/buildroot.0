From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Jul 2012 17:05:53 +0000 (UTC)
Subject: [Buildroot] [Bug 5360] buildroot fails when building "host-libglib2
 2.30.2 Building"
In-Reply-To: <bug-5360-163@https.bugs.busybox.net/>
References: <bug-5360-163@https.bugs.busybox.net/>
Message-ID: <20120716170553.20F5790E65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5360

--- Comment #17 from Shokurov Anton V. <anton@fit.com.ru> 2012-07-16 17:05:52 UTC ---
(In reply to comment #14)
> On which package did the fenv.h build problem occured?
> 
> Also, could you report your libglib2 problem to the upstream libglib
> developers?

This is crazy...
Now I can't login. (In the previous build of buildroot i had no problem, at
least after i disabled WCHAR).
I can login if i remove the 'x' from the second field of the /etc/passwd file.
The rest of the files (securitty, inittab) look fine (unaltered).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
