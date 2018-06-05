From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 05 Jun 2018 21:45:12 +0000
Subject: [Buildroot] [Bug 11066] x11r7 X11 S40xorg leads to a black screen
 on QEMU x86 but startx works
In-Reply-To: <bug-11066-163@https.bugs.busybox.net/>
References: <bug-11066-163@https.bugs.busybox.net/>
Message-ID: <bug-11066-163-FTVkA2yRdQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11066

--- Comment #2 from Ciro Santilli <ciro.santilli@gmail.com> ---
If I manually do the command that S40xorg would be doing after removing it,
i.e.:

/usr/bin/Xorg:0.0 vt01 -s 0 -noreset -allowMouseOpenFail

the screen also goes black.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
