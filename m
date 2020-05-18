From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 07:07:38 +0000
Subject: [Buildroot] [Bug 12626] PHP missing header files within 2020.02
In-Reply-To: <bug-12626-163@https.bugs.busybox.net/>
References: <bug-12626-163@https.bugs.busybox.net/>
Message-ID: <bug-12626-163-EAxVn8tCyf@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12626

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Fixed as of
https://git.buildroot.org/buildroot/commit/package/php?id=16e0bf6b9f9f681df8619c12e9504dc00fc28410

-- 
You are receiving this mail because:
You are on the CC list for the bug.
