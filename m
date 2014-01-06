From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  6 Jan 2014 19:03:41 +0000 (UTC)
Subject: [Buildroot] [Bug 6764] New: Support for kernel signed modules
Message-ID: <bug-6764-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6764

           Summary: Support for kernel signed modules
           Product: buildroot
           Version: unspecified
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cassiano at idbinfo.com.br
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Attached is a patch which enable signed kernel modules usage, when stripping is
activated on build options

If modules are stripped, the signing key is removed from it, preventing module
load.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
