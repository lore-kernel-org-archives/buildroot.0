From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:24:22 +0000 (UTC)
Subject: [Buildroot] [Bug 3277] New: quagga fails to build with SNMP support
Message-ID: <bug-3277-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3277

           Summary: quagga fails to build with SNMP support
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


checking for asn_parse_int in -lnetsnmp... no
configure: error: --enable-snmp given, but cannot find support for SNMP
make: *** [/home/test/outputs/test-375/build/quagga-0.99.17/.stamp_configured]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
