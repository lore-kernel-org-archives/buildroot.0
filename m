From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 27 Jun 2012 08:36:39 +0000 (UTC)
Subject: [Buildroot] [Bug 5330] New: update vsftpd to 3.0.0
Message-ID: <bug-5330-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5330

           Summary: update vsftpd to 3.0.0
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: aras.vaichas at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The December 2011 vsftpd-2.3.5 release caused a few headaches for people. 

http://www.benscobie.com/fixing-500-oops-vsftpd-refusing-to-run-with-writable-root-inside-chroot/

http://imbuzu.wordpress.com/2012/05/07/fixing-500-oops-vsftpd-refusing-to-run-with-writable-root-inside-chroot-on-vsftpd/

A "fix" was introduced in April 2012 with a release of vsftpd-3.0.0.

I have made a change to my copy (Buildroot-2012.05) and the
vsftpd-2.3.4-dont-force-largefile.patch patch applies without any problems.

Do I submit a patch through this interface (Bugzilla)?

Sorry, it's been ages since I've submitted patches, can someone please send me
a URL of the formal procedure, e.g. sign off, etc?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
