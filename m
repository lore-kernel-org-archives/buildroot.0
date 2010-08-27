From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Aug 2010 09:15:58 +0000 (UTC)
Subject: [Buildroot] [Bug 2443] New: Initramfs: Don't overwrite
 $(TARGET_DIR)/init if it exists
Message-ID: <bug-2443-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2443

           Summary: Initramfs: Don't overwrite $(TARGET_DIR)/init if it
                    exists
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: All
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: fpasch at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I'm using a custom init-script in initramfs (instead of /sbin/init). I placed
it in my target-skeleton.

The following patch is needed to disable overwriting it everytime initramfs.mk
is called.


Simon Pasch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
