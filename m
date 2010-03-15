From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 15 Mar 2010 03:37:39 +0000 (UTC)
Subject: [Buildroot] [Bug 1291] New: Add support for Faraday 526 arm
	processor (fa526)
Message-ID: <bug-1291-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1291

           Summary: Add support for Faraday 526 arm processor (fa526)
           Product: buildroot
           Version: 2010.02
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: cls at seawood.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1267)
 --> (https://bugs.busybox.net/attachment.cgi?id=1267)
v1.0

The Patriot Corza NAS (and a bunch of others) uses the Faraday 526 processor. 
This patch allows us to use buildroot to create a compatible sysroot for
extending the box.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
