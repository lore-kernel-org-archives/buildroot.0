From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Jul 2009 12:05:06 +0000 (UTC)
Subject: [Buildroot] [Bug 451] New: [PATCH] Upgrade from unmaintained
 dosfstools-2.11 to dosfstools-3.0.3
Message-ID: <bug-451-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=451

           Summary: [PATCH] Upgrade from unmaintained dosfstools-2.11 to
                    dosfstools-3.0.3
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mac at mcrowe.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=457)
 --> (https://bugs.busybox.net/attachment.cgi?id=457)
Upgrade to dosfstools-3.0.3

Move from old unmaintained dosfstools-2.11 (packaged as mkdosfs) to now
maintained dosfstools-3.0.3. Allow each binary to be installed independently.

Originally posted to mailing list 2009/06/18 but yielded no replies:
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/15572


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
