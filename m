From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 14:58:39 +0000 (UTC)
Subject: [Buildroot] [Bug 531] New: let e2fsprogs package to export headers
 to staging dir if needed
Message-ID: <bug-531-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=531

              Host: Ubuntu 9.0.4 Server 32 Bit
            Target: i686
             Build: i686
           Summary: let e2fsprogs package to export headers to staging dir
                    if needed
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: d.albano at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=563)
 --> (https://bugs.busybox.net/attachment.cgi?id=563)
Let e2fsprogs headers to be copied in staging dir if needed

Hi,

as, specificed in bug #529, e2fsprogs package actually doesn't copy headers
into staging dir so util-linux doesn't compile complaining about missing
blkid/blkid/.h

The attached patch add support exporting only headers to staging dir


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
