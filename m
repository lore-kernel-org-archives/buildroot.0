From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 24 Jul 2016 21:18:23 +0000
Subject: [Buildroot] [Bug 9021] Kodi - Broken: Illegal instruction (core
	dumped)
In-Reply-To: <bug-9021-163@https.bugs.busybox.net/>
References: <bug-9021-163@https.bugs.busybox.net/>
Message-ID: <bug-9021-163-MZhkfWGeYo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9021

--- Comment #2 from Bernd Kuhls <bernd.kuhls@t-online.de> ---
Please provide more infos about the crash, as a hint for required logs read
http://kodi.wiki/view/HOW-TO:Submit_a_bug_report#Right.2C_so_what_information_do_you_guys_need.3F

Please also read
http://kodi.wiki/view/Raspberry_Pi_FAQ#Raspberry_Pi_known_issues

Buildroot contains some patches for Kodi 16.1 but there maybe more patches
needed
to support raspberry pi. Since I do not own such a box I can not test it
myself,
the machine where I run Kodi on has in Intel CPU, its GPU is used for hardware
decoding using vaapi.

To get a hint about what might be needed for the raspberry pi have a look at
http://forum.kodi.tv/showthread.php?tid=231092

or try my Kodi 17 branch: https://github.com/bkuhls/buildroot/tree/kodi17

-- 
You are receiving this mail because:
You are on the CC list for the bug.
