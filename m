From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jul 2009 12:09:14 +0000 (UTC)
Subject: [Buildroot] [Bug 491] New: libxml2: Bump version to 0.7.3
Message-ID: <bug-491-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=491

           Summary: libxml2: Bump version to 0.7.3
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=507)
 --> (https://bugs.busybox.net/attachment.cgi?id=507)
Bump libxml2 version to 2.7.3.

Bump the version of libxml2 from 2.6.32 to 2.7.3. This introduces a number of
bug fixes and minor improvements.

The deletion of reject files can be removed from the makefile as the reject
files are gone from the latest release tarballs.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
