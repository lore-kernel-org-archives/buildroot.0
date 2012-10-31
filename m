From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 31 Oct 2012 16:27:29 +0000 (UTC)
Subject: [Buildroot] [Bug 5636] New: agetty - cannot get controlling tty
 error - need updated util-linux
Message-ID: <bug-5636-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5636

           Summary: agetty - cannot get controlling tty error - need
                    updated util-linux
           Product: buildroot
           Version: 2012.08
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: ccs_dba at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Using agetty and login from util-linux (no busybox utils), receive error
'cannot get controlling tty', unable to use without fix submitted to 2.21.1 and
beyound:

http://marc.info/?l=util-linux-ng&m=132334597319406&w=2

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
