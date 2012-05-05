From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  5 May 2012 15:13:04 +0000 (UTC)
Subject: [Buildroot] [Bug 5186] New: initramfs/cpio should support lzo
	compression
Message-ID: <bug-5186-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5186

           Summary: initramfs/cpio should support lzo compression
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: bos at je-eigen-domein.nl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created attachment 4340
  --> https://bugs.busybox.net/attachment.cgi?id=4340
cpio lzo support

Linux supports lzo compression for the initramfs image nowadays, so it would be
nice if buildroot did as well

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
