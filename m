From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 May 2018 14:13:37 +0000
Subject: [Buildroot] [Bug 11011] New: BUildroot for Raspberry Pi 2
Message-ID: <bug-11011-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11011

            Bug ID: 11011
           Summary: BUildroot for Raspberry Pi 2
           Product: buildroot
           Version: 2018.02.1
          Hardware: PC
                OS: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: umamahesh.y at hcl.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi
I am running latest buildroot version (2018.02.1) with kernel version 4.14 on
Raspberry Pi 2, I am unable to up the i2c interface and RTC interface. 

With i2cdetect -l it doesn't list anything. 

RTC it fails to register with /dev/rtc.

There is no dev nodes for i2c and rtc created by default.

Please suggest.

I wanted i2c and rtc running asap.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
