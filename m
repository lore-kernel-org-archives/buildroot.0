From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 26 Mar 2015 16:30:27 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] mkuser script fails with: user already
 exists with group nogroup
In-Reply-To: <bug-7976-163@https.bugs.busybox.net/>
References: <bug-7976-163@https.bugs.busybox.net/>
Message-ID: <20150326163027.78E05818CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-03-26 16:30:27 UTC ---
Created attachment 5956
  --> https://bugs.busybox.net/attachment.cgi?id=5956
Enhance error messages

Hello!

The only package we have that wants to add a user with group 'nogroup' is
the mysql package, and it builds just fine here.

Do you have a custom users table? Do you have a local package that wants
to add another user with group 'nogroup'?

In any case, care to apply the attached patch and report on the new error
message, please?  (note: this patch only expands the error message, and
does not attempt to provide a fix, since I can't reproduce).

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
