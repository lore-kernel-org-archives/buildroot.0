From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Jul 2017 20:45:28 +0000
Subject: [Buildroot] [Bug 10036] New: Buildroot builds Raspbian Jessie
 headless image presenting incorrect prompt
Message-ID: <bug-10036-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10036

            Bug ID: 10036
           Summary: Buildroot builds Raspbian Jessie headless image
                    presenting incorrect prompt
           Product: buildroot
           Version: 2017.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ptomov at mirion.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi,

After building a new headless raspbian Jessie image from the original Buildroot
clone, I flashed it into a CD card and started my Rasberry Pi 3 board with this
card. But the prompt in the login stage was "buidroot login:" and not as I
expected "rpi3 login:". Please advise me how to define the correct prompt name
before building my image.

Thanks,

   Pavel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
