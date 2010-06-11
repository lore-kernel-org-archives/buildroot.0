From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Jun 2010 13:18:28 +0000 (UTC)
Subject: [Buildroot] [Bug 2035] New: ipsec-tools-0.7.2 fails to build with
	gcc-4.4.x
Message-ID: <bug-2035-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2035

           Summary: ipsec-tools-0.7.2 fails to build with gcc-4.4.x
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: nnazarenko at radiofid.ru
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


ipsec-tools fails to build with uclibc and gcc-4.4.x. 

isakmp.c: In function 'isakmp_handler':
isakmp.c:248: error: dereferencing pointer 'udp' does break strict-aliasing
rules
isakmp.c:247: note: initialized from here
make[5]: *** [isakmp.o] Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
