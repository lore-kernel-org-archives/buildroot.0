From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Dec 2011 15:31:52 +0000 (UTC)
Subject: [Buildroot] [Bug 4622] New: Unable to download properly file
 fakeroot_1.9.5.tar.gz
Message-ID: <bug-4622-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4622

           Summary: Unable to download properly file fakeroot_1.9.5.tar.gz
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: arco at ieec.uab.es
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Hi,

I have downloaded linuxbuild 1-0-1 and run make xconfig. Selecting all the
choices possible (Upgrade kernel, linux-loader and selected buildroot) I
trigger the make build command.

It seems that when it tries to download fakeroot_1.9.5.tar.gz file, it
downloads a html file instead.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
