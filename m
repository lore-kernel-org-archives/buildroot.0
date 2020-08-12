From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 12 Aug 2020 15:38:14 +0000
Subject: [Buildroot] [Bug 13146] raspberrypi3_defconfig: "Inappropriate
 ioctl for device" almost at end when sdcard.img is created
In-Reply-To: <bug-13146-163@https.bugs.busybox.net/>
References: <bug-13146-163@https.bugs.busybox.net/>
Message-ID: <bug-13146-163-sJZdHi6new@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13146

--- Comment #14 from Marie Maurer <marie.maurer@mmeacs.de> ---
This is the info I got under Linux:

marie at 2020L009:~$ uname -a
Linux 2020L009 4.4.0-19041-Microsoft #1-Microsoft Fri Dec 06 14:06:00 PST 2019
x86_64 x86_64 x86_64 GNU/Linux

This is the info I got under Windows (partly Powershell):

PS C:\WINDOWS\system32> wsl -l -v
  NAME      STATE           VERSION
* Ubuntu    Stopped         1
PS C:\WINDOWS\system32>

C:\tmp>ver

Microsoft Windows [Version 10.0.19041.450]

C:\tmp>systeminfo.exe

Betriebssystemversion: 10.0.19041 Nicht zutreffend Build 19041

=> I assume it is WSL 1

-- 
You are receiving this mail because:
You are on the CC list for the bug.
