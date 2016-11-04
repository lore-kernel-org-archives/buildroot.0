From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Nov 2016 08:44:11 +0000
Subject: [Buildroot] [Bug 8516] mkcubiecard.sh uses outdated sfdisk switch -D
In-Reply-To: <bug-8516-163@https.bugs.busybox.net/>
References: <bug-8516-163@https.bugs.busybox.net/>
Message-ID: <bug-8516-163-Lpb8uODwVo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8516

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
(In reply to Tudor from comment #4)
Not sure what you mean here. The bug report was related to the mkcubieboard.sh
script, which was only used for the cubieboard_defconfig, to create the SD
card.

The cubieboard2_defconfig uses genimage to generate the SD card.

Since the cubieboard_defconfig was causing problems and nobody updated it in
more than a year, it was removed. The cubieboard2_defconfig, which has been
updated much more recently, has been kept.

Am I missing something?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
