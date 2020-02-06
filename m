From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 06 Feb 2020 13:36:04 +0000
Subject: [Buildroot] [Bug 12511] rng-tools has forced dependency on
 jitterentropy-library ; It slows boot considerably
In-Reply-To: <bug-12511-163@https.bugs.busybox.net/>
References: <bug-12511-163@https.bugs.busybox.net/>
Message-ID: <bug-12511-163-r6bPNZdOus@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12511

--- Comment #3 from Axel Voitier <axel.voitier@gmail.com> ---
(In reply to Matt Weber from comment #2)

I can confirm it works in my case.
Although, I am not using systemd, so I cannot test that part of the patch.


Cheers,
Axel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
