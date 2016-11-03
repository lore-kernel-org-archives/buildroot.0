From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Nov 2016 21:53:19 +0000
Subject: [Buildroot] [Bug 8516] mkcubiecard.sh uses outdated sfdisk switch -D
In-Reply-To: <bug-8516-163@https.bugs.busybox.net/>
References: <bug-8516-163@https.bugs.busybox.net/>
Message-ID: <bug-8516-163-ueQdyiimmM@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8516

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Since nobody provided any update to this board defconfig for a very long time,
I've removed this defconfig from the tree. See
https://git.buildroot.org/buildroot/commit/?id=01432196cd0ab3e618d51309283b8ca34ec3bf75.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
