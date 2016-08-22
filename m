From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Aug 2016 00:27:22 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-an7XGv8bdC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

--- Comment #7 from Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> ---
Hi Christophe,

Comparing the last config file you attached against current 4.x config
board/minnowboard/linux-4.6.config, I cannot see any added options that would
make this work.

Could you mind trying this using "make minnowboard_max_defconfig"? It uses
board/minnowboard/linux-4.6.config. Given the above I suspect it will work just
fine.

Of ocurse, if we are missing any option, it would be great to add it.

Thanks a lot!
Ezequiel

-- 
You are receiving this mail because:
You are on the CC list for the bug.
