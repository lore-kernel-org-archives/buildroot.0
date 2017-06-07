From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 07 Jun 2017 08:58:32 +0000
Subject: [Buildroot] [Bug 9941] New: nodejs option disappears for arm
Message-ID: <bug-9941-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9941

            Bug ID: 9941
           Summary: nodejs option disappears for arm
           Product: buildroot
           Version: 2017.02.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: tuzakli.refik at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hello

When I choose ARM architecture, nodejs option disappears in "Target packages"
even I select all dependencies.

When I select  alder version of nodejs in "Legacy config options", nodejs in
"Target Packages" appears and automatically selected but this time I cannot
compile the selections.

for buildroot 2016.11, I could select nodejs for arm. so there was no problem.

Is this an bug or are there another problem for newer version of builroot.

Best regards.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
