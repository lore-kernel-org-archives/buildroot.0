From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Sep 2014 12:27:59 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit doesn't start with glibc 2.19 because
 geteuid() fails
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140904122759.CF45E9D5EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

--- Comment #4 from syntheticpp at gmx.net 2014-09-04 12:27:59 UTC ---
> 
> GCC warns while linking:
> y.tab.c:(.text+0x379c): warning: Using 'getpwuid' in statically linked
> applications requires at runtime the shared libraries from the glibc version
> used for linking

This warning also shows up in the build which works (eglibc 2.18)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
