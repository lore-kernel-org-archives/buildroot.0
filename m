From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Nov 2009 18:40:25 +0000 (UTC)
Subject: [Buildroot] [Bug 719] New: Add lua option to haserl
Message-ID: <bug-719-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=719

              Host: i686-linux
            Target: arm-softfloat-linux-uclibcgnueabi
           Summary: Add lua option to haserl
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: gustavo at zacarias.com.ar
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=751)
 --> (https://bugs.busybox.net/attachment.cgi?id=751)
Add lua option to haserl

This patch adds the option for haserl-0.9.x to enable it's lua mode.
Right now it links against lua in LUA_DIR.
Ideally the lua package should introduce a PACKAGE_LIBLUA option to just
install libs/headers to STAGING_DIR since haserl doesn't need the binaries.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
