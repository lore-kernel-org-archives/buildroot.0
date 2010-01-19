From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 19 Jan 2010 20:01:21 +0000 (UTC)
Subject: [Buildroot] [Bug 937] New: Bump openvpn package to 2.1.1
Message-ID: <bug-937-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=937

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump openvpn package to 2.1.1
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=961)
 --> (https://bugs.busybox.net/attachment.cgi?id=961)
Bump openvpn package to 2.1.1

Should work with avr32 (testers wanted).
Added options to disable LZO/OpenSSL (default=y to keep functionality in the
previous BR version) - makes binary smaller, lowers deps.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
