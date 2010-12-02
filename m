From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Dec 2010 07:48:29 +0000 (UTC)
Subject: [Buildroot] [Bug 2875] New: Kernel doesn't build Ext2 support
	out-of-the-box
Message-ID: <bug-2875-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2875

           Summary: Kernel doesn't build Ext2 support out-of-the-box
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: tuukka.pasanen at ilmi.fi
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Because kernel doesn't build Ext2 support out-of-the-box if you choose i386 for
default config you can use iso-image without minor tuning of kernel .config
file. This should work like initrd thing.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
