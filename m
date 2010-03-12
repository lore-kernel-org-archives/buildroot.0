From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 12 Mar 2010 23:45:10 +0000 (UTC)
Subject: [Buildroot] [Bug 1273] New: BR2_INET_IPV6 does not enable IPv6 in
	pppd
Message-ID: <bug-1273-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1273

           Summary: BR2_INET_IPV6 does not enable IPv6 in pppd
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1213)
 --> (https://bugs.busybox.net/attachment.cgi?id=1213)
enable ipv6 in pppd

IPv6 is not enabled in pppd when BR2_INET_IPV6 is selected.  I have attached a
trival patch is attached that fixes this.

Cheers


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
