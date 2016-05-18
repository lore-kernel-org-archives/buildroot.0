From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 18 May 2016 11:57:22 +0000
Subject: [Buildroot] [Bug 8936] New: Aircrack-ng - Alot of missing depencies
Message-ID: <bug-8936-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8936

            Bug ID: 8936
           Summary: Aircrack-ng - Alot of missing depencies
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: All
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: lipkegu at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

The package "Aircrack-ng" has missing dependencies. 

Airmon-ng as its own needs: 
rfkill, 
ethtool, 
wireless-tools
iw
iwconfig 


to put wireless cards into monitor mode. these dependencies are also mentored
on the webpage on the aircrack-ng site =(

When i select the package it does not select these dependencies :(

-- 
You are receiving this mail because:
You are on the CC list for the bug.
