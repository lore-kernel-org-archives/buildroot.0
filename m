From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  2 Dec 2009 22:38:09 +0000 (UTC)
Subject: [Buildroot] [Bug 769] New: Update configuration menu for MIPS target
Message-ID: <bug-769-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=769

              Host: Any
            Target: MIPS/MIPSel
           Summary: Update configuration menu for MIPS target
           Product: buildroot
           Version: 2009.11
          Platform: Other
               URL: http://morethan.org/bldrt/mips_arch.ods
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: minimod at morethan.org
        ReportedBy: minimod at morethan.org
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The MIPS portion of the configuration menu is outdated
and does not define the complete set of toolchain options
for current cores.

At the above link, the following link and as an attachment
is the table of information from which the additional
configuration menu entries will be defined.

Table 1 shows the relationship between feature names and
the instruction set.

Table 2 shows the relationship between core code names
and features.

The actual configuration menu patch will follow any day, RSN.

http://morethan.org/bldrt/mips_arch.ods

Mikez


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
