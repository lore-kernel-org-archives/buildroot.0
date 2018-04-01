From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 01 Apr 2018 10:48:16 +0000
Subject: [Buildroot] [Bug 10531] QtWebengine doesn't build if the host
 hasn't a 32 bits C++ compiler working
In-Reply-To: <bug-10531-163@https.bugs.busybox.net/>
References: <bug-10531-163@https.bugs.busybox.net/>
Message-ID: <bug-10531-163-28mVbbfsXK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10531

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=27d22296927d7e4ec0965f2bdaa272b1e8ea15e7.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
