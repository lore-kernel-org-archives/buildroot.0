From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  6 May 2015 12:35:05 +0000 (UTC)
Subject: [Buildroot] [Bug 8086] New: Cannot select systemd as init with
 Linaro 2014.09 toolchain selected
Message-ID: <bug-8086-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8086

           Summary: Cannot select systemd as init with Linaro 2014.09
                    toolchain selected
           Product: buildroot
           Version: unspecified
          Platform: Other
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: l_giuliani at hotmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


On last development version 2015.05 rc1 of Buildroot,  
when external toolchain Linaro 2014.09 is selected, Systemd cannot be choosed
as init system.

From ./toolchain/toolchain-external/Config.in for
BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM and  BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1 is selected 

But in ./system/Config.in for  BR2_INIT_SYSTEMD you need at least
BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10

From Linaro website Linaro 2014.09 is build against 3.17 linux kernel :
https://wiki.linaro.org/Cycles/1409/Release

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
