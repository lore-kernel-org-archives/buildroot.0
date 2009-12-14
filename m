From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 14 Dec 2009 20:36:24 +0000 (UTC)
Subject: [Buildroot] [Bug 813] New: Drop not very useful generic package
 selection options (access point, firewall, dev system)
Message-ID: <bug-813-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=813

           Summary: Drop not very useful generic package selection options
                    (access point, firewall, dev system)
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=843)
 --> (https://bugs.busybox.net/attachment.cgi?id=843)
Drop generic package selection options

Don't think they're too useful or used generally.
They're open to multiple interpretations so people could ask for more/less
packages to suit their needs and new options for other things (like generic
access point, generic NAS, so on...) without a clear definition of which
packages would be required/the bare minimum for them.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
