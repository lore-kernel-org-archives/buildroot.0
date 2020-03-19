From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 19 Mar 2020 01:26:08 +0000
Subject: [Buildroot] [Bug 12666] New: Doesn't pick up a custom bash profile
Message-ID: <bug-12666-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12666

            Bug ID: 12666
           Summary: Doesn't pick up a custom bash profile
           Product: buildroot
           Version: 2019.02.2
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: alex.demyankov at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,
   buildroot does not take the user's profile.

I tried to change ./system/skeleton/etc/profile itself, I tried to add .sh
files into ./system/skeleton/etc/profile.d/ but nothings seems help. The final
image ends up with no user profile.

Thanks,
Alex

-- 
You are receiving this mail because:
You are on the CC list for the bug.
