From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 30 Nov 2014 17:41:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7682] New: Missing dependencies for NFS
Message-ID: <bug-7682-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7682

           Summary: Missing dependencies for NFS
           Product: buildroot
           Version: 2014.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: mfld.fr at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Selecting nfs-utils package does not automatically select the rpcbind package
(needed at runtime by rpc.statd) and does not check for RPC support in uclibc
(needed at buildtime by rpcbind).

NFS on embedded device ? Yeah, I need it on my BeagleBoneBlack for a cheap NAS
:-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
