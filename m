From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  6 May 2010 16:35:29 +0000 (UTC)
Subject: [Buildroot] [Bug 1717] New: External toolchain fixes for hostapd &
 wpa_supplicant
Message-ID: <bug-1717-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1717

              Host: i686-linux
            Target: powerpc-uclibc
           Summary: External toolchain fixes for hostapd & wpa_supplicant
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 1675
  --> https://bugs.busybox.net/attachment.cgi?id=1675
Fix wpa_supplicant build with external toolchain

wpa_supplicant doesn't like external toolchain, so fix it.
Tested by Marc-Andr? H?bert.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
