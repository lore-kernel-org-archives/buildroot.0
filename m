From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 14 Feb 2016 21:10:39 +0000
Subject: [Buildroot] [Bug 8516] mkcubiecard.sh uses outdated sfdisk switch -D
In-Reply-To: <bug-8516-163@https.bugs.busybox.net/>
References: <bug-8516-163@https.bugs.busybox.net/>
Message-ID: <bug-8516-163-OUj5IOfL1k@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8516

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Tudor, we would prefer to use "genimage" to generate a full SD card image for
the Cubieboard. Would you be willing to work on this and submit a patch?
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
