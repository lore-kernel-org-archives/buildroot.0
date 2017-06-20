From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jun 2017 19:36:21 +0000
Subject: [Buildroot] [Bug 9976] New: License file for package 'rtl8821au'
	incorrect
Message-ID: <bug-9976-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9976

            Bug ID: 9976
           Summary: License file for package 'rtl8821au' incorrect
           Product: buildroot
           Version: 2017.02.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: nwright98 at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The file package/rtl8821au/rtl8821au.mk specifies:

RTL8821AU_LICENSE_FILES = COPYING

However, there is no 'COPYING' file in the package.  There is a file named
'LICENSE'.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
