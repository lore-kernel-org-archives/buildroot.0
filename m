From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 18:53:32 +0000 (UTC)
Subject: [Buildroot] [Bug 79] New: No version-number for the Freetype-package
Message-ID: <bug-79-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=79

            Target: i386
           Summary: No version-number for the Freetype-package
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: kretschi at online.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When downloading the Freetype-tar.bz2 it trys the URL
http://easynews.dl.sourceforge.net/sourceforge/freetype/freetype-.tar.bz2.
So I think, it doesn't get the information about which version he should build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
