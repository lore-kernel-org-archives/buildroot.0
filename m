From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 23 Jun 2020 01:59:48 +0000
Subject: [Buildroot] [Bug 13021] New: Minor code error when building
 granite-0.4.1
Message-ID: <bug-13021-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13021

            Bug ID: 13021
           Summary: Minor code error when building granite-0.4.1
           Product: buildroot
           Version: 2020.05
          Hardware: Macintosh
                OS: Linux
            Status: NEW
          Severity: minor
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: testosdevsteam at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The problem stems specifically when building granite gets to
/lib/Services/Settings.vala and crashes the compilation.


FYI: This bug is hard to reproduce.

How to reproduce:

1) Get a longterm support version of buildroot.

2) Make a linux config with granite enabled

3) Get the 2020.05 version of buildroot and install it on the latest version of
Ubuntu with dependencies installed. 

2) Copy over longterm config to 2020.5

3) do sudo make or make on 2020.5




What actually happened:

Granite throws 5 compilation errors then crashes the distro building process.


Expected behavior:

No errors and smooth compilation.


Build 2020.05 on MacBook Pro mid-2017 Hardware (running a Ubuntu VM)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
