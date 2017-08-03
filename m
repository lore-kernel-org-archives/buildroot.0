From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Aug 2017 13:54:32 +0000
Subject: [Buildroot] [Bug 10141] Squashfs extended attribute failures
In-Reply-To: <bug-10141-163@https.bugs.busybox.net/>
References: <bug-10141-163@https.bugs.busybox.net/>
Message-ID: <bug-10141-163-e0H5DLw5YT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10141

--- Comment #4 from clayton.shotwell at rockwellcollins.com ---
(In reply to Yann E. MORIN from comment #2)

Yann,

I ran a test overnight on 4 different builds with the "-processors 1" argument
added to the squashfs creation and saw no errors whatsoever. This however adds
quite a bit of time to the squashfs creation so I would like to avoid that if
possible to keep the build time as short as possible.

Thanks,
Clayton

-- 
You are receiving this mail because:
You are on the CC list for the bug.
