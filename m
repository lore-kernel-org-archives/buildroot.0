From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 Jan 2010 20:45:25 +0000 (UTC)
Subject: [Buildroot] [Bug 1003] New: DHCP options disabled with
	busybox-1.16.0
Message-ID: <bug-1003-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1003

           Summary: DHCP options disabled with busybox-1.16.0
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: buildroot at istwok.net
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In busybox-1.16.0, the CONFIG_APP_xxDHCPxx configuration options were changed
to CONFIG_xxDHCPxx (i.e. the "APP" part was dropped.  This causes the DHCP
options to be disabled when the default, busybox-1.13.x.config is used.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
