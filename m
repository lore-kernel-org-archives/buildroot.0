From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 May 2011 19:48:24 +0000 (UTC)
Subject: [Buildroot] [Bug 3757] New: Buildroot can't build mplayer with
	libmad
Message-ID: <bug-3757-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3757

           Summary: Buildroot can't build mplayer with libmad
           Product: buildroot
           Version: 2011.02
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: sasamy at yandex.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


mplayer.mk:

ifeq ($(BR2_PACKAGE_MAD),y)

should be:

ifeq ($(BR2_PACKAGE_LIBMAD),y)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
