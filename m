From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  9 Mar 2011 10:27:03 +0000 (UTC)
Subject: [Buildroot] [Bug 3445] New: Not working openssl-10.0.0d on 386sx
Message-ID: <bug-3445-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3445

           Summary: Not working openssl-10.0.0d on 386sx
           Product: buildroot
           Version: 2011.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: milospokorny at seznam.cz
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


In buildroot configuration, selecting 'Target architecture variant' i386 and
then running on 80386sx processor makes libcrypto generate SIGILL (running ssh,
openvpn etc ). For this configuration, parametter "386" should be passed to
configure script of openssl.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
