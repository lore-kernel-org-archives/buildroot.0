From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  8 Apr 2010 13:12:15 +0000 (UTC)
Subject: [Buildroot] [Bug 1525] New: Package hal deletes a whole
 <target>/etc/rc.d directory
Message-ID: <bug-1525-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1525

           Summary: Package hal deletes a whole <target>/etc/rc.d directory
           Product: buildroot
           Version: 2010.02
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arcadyg at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


While building hal package the directory $(TARGET_DIR)/etc/rc.d removed by the
hal.mk script. In case, for example, that User has his own FS skeleton this
will deletes also important initial scripts and the resulting FS image will be
unusable.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
