From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Aug 2016 17:32:26 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-j5DvfHfg06@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #10 from Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> ---
(In reply to CB from comment #8)

CONFIG_BLK_DEV_SD=y
CONFIG_USB_STORAGE=y

Both options are currently enabled, so you shouldn't be missing anything.

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
