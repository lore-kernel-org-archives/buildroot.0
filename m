From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Aug 2010 13:18:09 +0000 (UTC)
Subject: [Buildroot] [Bug 2449] New: Minor fixes for squashfs makefile and
 correct PowerPC e500 setting in uclibc config
Message-ID: <bug-2449-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2449

           Summary: Minor fixes for squashfs makefile and correct PowerPC
                    e500 setting in uclibc config
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: realloc at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 2383
  --> https://bugs.busybox.net/attachment.cgi?id=2383
squashfs typo fix, uclibc e500 config fix

* Because of type squashfs makefile was ignoring endian option

* Empty uClibc config path caused error during build. Now if the option is
empty it takes the default config for selected version.

* PowerPC E500 arch option was not set correctly in uclibc config.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
