From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Nov 2009 15:23:43 +0000 (UTC)
Subject: [Buildroot] [Bug 715] New: Bump libidn package to 1.15 and other
	fixes
Message-ID: <bug-715-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=715

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Bump libidn package to 1.15 and other fixes
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=747)
 --> (https://bugs.busybox.net/attachment.cgi?id=747)
Bump libidn package to 1.15

Bump libidn package to 1.15 and other fixes:
* Add target uninstall.
* Remove stray /usr/share/emacs files.
* Remove stray mono (host, autodetected) dll installation in
$(TARGET_DIR)/usr/lib by disabling C# altogether.
* Disable java.
* Add new option to install idn binary (default N, usually not required).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
