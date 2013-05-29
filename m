From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 May 2013 06:23:51 +0000 (UTC)
Subject: [Buildroot] [Bug 6290] New: copying the kernel fails
Message-ID: <bug-6290-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6290

           Summary: copying the kernel fails
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: critical
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: jungmann0 at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I want to build a linux system for my arm-based PDA (Intel PXA255 processor).
The build fails with the following message:

# dtbs moved from arch/RCH/boot to arch/RCH/boot/dts since 3.8-rc1
cp  /home/jakob/Downloads/Buildroot/output/target/boot/
cp is missing the destination
?cp --help? gives more information.
make: ***
[/home/jakob/Downloads/Buildroot/output/build/linux-3.7.8/.stamp_target_installed]
Error 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
