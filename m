From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 19:26:55 +0000 (UTC)
Subject: [Buildroot] [Bug 1489] New: radvd update to 1.6
Message-ID: <bug-1489-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1489

           Summary: radvd update to 1.6
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: alex at digriz.org.uk
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1477)
 --> (https://bugs.busybox.net/attachment.cgi?id=1477)
update radvd package information

As well as updating the version of radvd that is pulled down (from 1.5 to 1.6)
I also removed the unneeded cruft from radvd.mk (just reflects the defaults)
and since version 1.5 radvd is fixed for parallel building so $(MAKE1) is no
longer needed.

I also updated Config.in to also reflect it's dependency on
BR2_PACKAGE_FLEX_LIBFL (similarly to how gob2/ipsec-tools does).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
