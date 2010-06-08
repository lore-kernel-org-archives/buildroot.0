From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jun 2010 18:49:17 +0000 (UTC)
Subject: [Buildroot] [Bug 1993] New: Bump bash to 4.1.7(1) and migrate to
	autotargets
Message-ID: <bug-1993-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1993

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump bash to 4.1.7(1) and migrate to autotargets
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Bump bash to 4.1.7(1) and migrate to autotargets.
/bin/sh logic is now save the link/file if it exists as /bin/sh.prebash to
restore it later if bash is uninstalled. Bash assumes it's superior and
replaces it.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
