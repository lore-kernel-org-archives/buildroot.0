From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Dec 2009 19:15:13 +0000 (UTC)
Subject: [Buildroot] [Bug 817] New: integrator926_defconfig uses unsupported
 uboot board name
Message-ID: <bug-817-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=817

           Summary: integrator926_defconfig uses unsupported uboot board
                    name
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Keywords: patch
          Severity: trivial
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: grant.b.edwards at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=859)
 --> (https://bugs.busybox.net/attachment.cgi?id=859)
Patch to change default integrtor926 uboot board name to a supported value

The uboot board name default in the integrator926 default
config isn't supported by u-boot.  I've changed it from
$(BOARD_NAME) to cp926ejs.

I'm not 100% sure this is the correct one of the uboot arm 926
targets, but at least the default config will now build.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
