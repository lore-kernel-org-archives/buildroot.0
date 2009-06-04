From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2009 12:50:11 +0000 (UTC)
Subject: [Buildroot] [Bug 373] New: Support for building gstreamer without
	libxml
Message-ID: <bug-373-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=373

           Summary: Support for building gstreamer without libxml
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: will.newton at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=375)
 --> (https://bugs.busybox.net/attachment.cgi?id=375)
Add support for building gstreamer without libxml2

Hi,

This patch adds support for building gstreamer without XML enabled, which saves
the space needed for libxml2 on the target. The default build behaviour should
be unchanged.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
