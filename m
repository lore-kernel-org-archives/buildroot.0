From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Jul 2017 16:27:51 +0000
Subject: [Buildroot] [Bug 10051] New: make: *** No rule to make target
 'raspberrpi3_defconfig'. Stop reported with Buildroot v 2o17.05.1
Message-ID: <bug-10051-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10051

            Bug ID: 10051
           Summary: make: *** No rule to make target
                    'raspberrpi3_defconfig'.  Stop reported with Buildroot
                    v 2o17.05.1
           Product: buildroot
           Version: 2017.05.1
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ptomov at mirion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7106
  --> https://bugs.busybox.net/attachment.cgi?id=7106&action=edit
Screenshot of the error

Hi,


I cloned the Buildroot to version 2017.05.1. with:

git clone https://git.buildroot.net/buildroot

But now when running 

make rasberrypi3_defconfig

Buildroot does not create a .config file in  /../../buildroot/ folder. The
following error was reported:

make: *** No rule to make target 'raspberrpi3_defconfig'.  Stop.

In did not change any configuration. The Make file is the original one. Please
see the attached screenshot and advise me how to fix this problem.

Thanks,

   Pavel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
