From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Feb 2011 12:59:14 +0000 (UTC)
Subject: [Buildroot] [Bug 3331] New: xdata_xcursor-themes depends on
	xcursorgen
Message-ID: <bug-3331-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3331

           Summary: xdata_xcursor-themes depends on xcursorgen
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: rotwang at crux.org.pl
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


checking for xcursorgen... no
configure: error: xcursorgen is required to build these cursors.
make: ***
[/mnt/usb/repos/buildroot/output/build/xdata_xcursor-themes-1.0.2/.stamp_configured]
Error 1

target: i586
host: i686
toolchain: buildroot
buildroot: latest from git

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
