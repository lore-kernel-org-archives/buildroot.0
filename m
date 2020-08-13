From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Aug 2020 21:05:08 +0000
Subject: [Buildroot] [Bug 13111] python-gunicorn: missing dependency on
 python-setuptools
In-Reply-To: <bug-13111-163@https.bugs.busybox.net/>
References: <bug-13111-163@https.bugs.busybox.net/>
Message-ID: <bug-13111-163-E5fysSHuZc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13111

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=f242f9bad97be17e8ffb01d0aef7b88696ad6cc9.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
