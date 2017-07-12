From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Jul 2017 16:52:43 +0000
Subject: [Buildroot] [Bug 10056] New: No .config file was produced in
	/buildroot folder
Message-ID: <bug-10056-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10056

            Bug ID: 10056
           Summary: No .config file was produced in /buildroot folder
           Product: buildroot
           Version: 2017.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ptomov at mirion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

When running:

make raspberrypi3_defconfig

no .config file was produces in /buildroot folder 
despite the message. Please see the screenshot and
advise me how to solve this problem. Did something 
change in where Buildroot produces this .config file.

According to your answer to my previous ticket10011,

in order to enable "SUDO" command in the image, I have to
add BR2_PACKAGE_SUDO=y into this .config file.

Thanks,

   Pavel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
