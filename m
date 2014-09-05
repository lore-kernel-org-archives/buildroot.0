From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Sep 2014 10:26:23 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit doesn't start with glibc 2.19 because
 geteuid() fails
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140905102623.366B59D604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

--- Comment #8 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-09-05 10:26:22 UTC ---
Indeed, the build warns about the use os the NSS functions in statically linked
applications.

However, this is only a warning, and not a build failure.

monit should not build a static application to start with. Changing the subject
to reflect the real issue.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
