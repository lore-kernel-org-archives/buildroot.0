From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Jun 2018 20:04:00 +0000
Subject: [Buildroot] [Bug 11101] host-patchelf Endian Issue with relative
 RPATH
In-Reply-To: <bug-11101-163@https.bugs.busybox.net/>
References: <bug-11101-163@https.bugs.busybox.net/>
Message-ID: <bug-11101-163-2rVFikCny0@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11101

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=17c9810fe76377fb928579e2b99f03f8ae31addb.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
