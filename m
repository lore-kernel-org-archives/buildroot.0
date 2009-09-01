From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Sep 2009 17:15:08 +0000 (UTC)
Subject: [Buildroot] [Bug 587] New: Use iptables multipurpose binaries and
	bump to 1.4.4
Message-ID: <bug-587-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=587

              Host: i686
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Use iptables multipurpose binaries and bump to 1.4.4
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=631)
 --> (https://bugs.busybox.net/attachment.cgi?id=631)
Use multipurpose binary for iptables by Olaf Rempel

This patch was sent by Olaf Rempel <razzor@kopf-tisch.de> to the mailing list
some time ago so all credit should go to him.
I just bumped iptables to version 1.4.4 and disabled the libtool patch since
it's no longer necessary.
I'm posting in the bug tracker in order to get it rolling at some point.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
