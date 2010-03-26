From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Mar 2010 06:42:20 +0000 (UTC)
Subject: [Buildroot] [Bug 1399] New: xfont_font-adobe-100dpi does not build
Message-ID: <bug-1399-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1399

              Host: X86_64
            Target: ARM
             Build: buildroot-git
           Summary: xfont_font-adobe-100dpi does not build
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: paul.jones at iwtech.com.au
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=1363)
 --> (https://bugs.busybox.net/attachment.cgi?id=1363)
Build log

GEN    symb08.pcf.gz
  GEN    symb10.pcf.gz
  GEN    symb12.pcf.gz
  GEN    symb14.pcf.gz
  GEN    symb18.pcf.gz
  GEN    symb24.pcf.gz
  GEN    courB08-ISO8859-1.bdf
/bin/sh: courB08.bdf: command not found
make[1]: *** [courB08-ISO8859-1.bdf] Error 127
make[1]: *** Waiting for unfinished jobs....
  GEN    courB10-ISO8859-1.bdf
  GEN    courB12-ISO8859-1.bdf
/bin/sh: courB10.bdf: command not found
/bin/sh: courB12.bdf: command not found
make[1]: *** [courB10-ISO8859-1.bdf] Error 127
make[1]: *** [courB12-ISO8859-1.bdf] Error 127
make[1]: Leaving directory
`/media/stuff/kisssroot/output/build/xfont_font-adobe-100dpi-1.0.1'
make: ***
[/media/stuff/kisssroot/output/build/xfont_font-adobe-100dpi-1.0.1/.stamp_built]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
