From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Nov 2015 20:23:58 +0000 (UTC)
Subject: [Buildroot] [Bug 8491] New: libglib2 2.46.1 not Building for armv5
 on 2015.11-rc3
Message-ID: <bug-8491-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8491

           Summary: libglib2 2.46.1 not Building for armv5 on 2015.11-rc3
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P2
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: brandurs at yahoo.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When configure runs..
configure: WARNING: unrecognized options: --disable-doc, --disable-docs,
--disable-documentation, --with-xmlto, --with-fop, --enable-ipv6

when building..
  CC       libglib_2_0_la-gthread.lo
/tmp/.private/root/ccSdfBdl.s: Assembler messages:
/tmp/.private/root/ccSdfBdl.s:1010: Error: shifts in CMP/MOV instructions are
only supported in unified syntax -- `mov r12,r12,ror#3'
/tmp/.private/root/ccSdfBdl.s:1010: Error: shifts in CMP/MOV instructions are
only supported in unified syntax -- `mov r12,r12,ror#13'
/tmp/.private/root/ccSdfBdl.s:1011: Error: shifts in CMP/MOV instructions are
only supported in unified syntax -- `mov r12,r12,ror#29'
/tmp/.private/root/ccSdfBdl.s:1011: Error: shifts in CMP/MOV instructions are
only supported in unified syntax -- `mov r12,r12,ror#19'
/tmp/.private/root/ccSdfBdl.s:1012: Error: lo register required -- `orr
r10,r10,r10'
Makefile:2087: recipe for target 'libglib_2_0_la-gslice.lo' failed

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
