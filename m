From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 14:57:24 +0000 (UTC)
Subject: [Buildroot] [Bug 6638] New: pkgconf doesn't download
Message-ID: <bug-6638-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6638

           Summary: pkgconf doesn't download
           Product: buildroot
           Version: 2013.08
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: masrur.macece at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


pkgconf is not downloading as the URL for pkgconf no longer exists.

OLD URL:
http://tortois.es/~nenolod/distfiles

NEW URL:
http://rabbit.dereferenced.org/~nenolod/distfiles/

Here's the diff report:
8c8
< PKGCONF_SITE = http://tortois.es/~nenolod/distfiles
---
> PKGCONF_SITE = http://rabbitdereferenced.org/~nenolod/distfiles

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
