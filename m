From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  9 Apr 2015 13:06:57 +0000 (UTC)
Subject: [Buildroot] [Bug 8006] New: rpcdebug in nfs-utils built for the host
Message-ID: <bug-8006-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8006

           Summary: rpcdebug in nfs-utils built for the host
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Reported by Montiainen on IRC: in the nfs-utils package, the rpcdebug tool is
built for the host, but installed on the target.

This tool should probably be built for the target. The patch
package/nfs-utils/0002-Patch-taken-from-Gentoo.patch is incorrect. Upstream has
fixed the issue in a newer version of nfs-utils, see
http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=adabe938c17b22aec5e89c24e1856de9fffe9f0c.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
