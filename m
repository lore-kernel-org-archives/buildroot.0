From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 04 Sep 2020 14:59:05 +0000
Subject: [Buildroot] [Bug 12911] usb_modeswitch installation race condition
In-Reply-To: <bug-12911-163@https.bugs.busybox.net/>
References: <bug-12911-163@https.bugs.busybox.net/>
Message-ID: <bug-12911-163-ezO2szfjXE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12911

Thomas Petazzoni <thomas.petazzoni@bootlin.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@bootlin.com> ---
Thanks, applied as
https://git.buildroot.org/buildroot/commit/?id=345c68f04fe60f31b2610d88c89dcccfba960623

-- 
You are receiving this mail because:
You are on the CC list for the bug.
