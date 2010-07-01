From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  1 Jul 2010 12:43:02 +0000 (UTC)
Subject: [Buildroot] [Bug 2155] New: Compression lzo don't set  for ubifs
Message-ID: <bug-2155-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2155

           Summary: Compression lzo don't set  for ubifs
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fant at vinnitsa.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Please correct file root/fs/ubifs/ubifs.mk line 12 to:
ifeq ($(BR2_TARGET_ROOTFS_UBIFS_RT_LZO),y)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
