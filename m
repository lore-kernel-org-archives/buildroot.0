From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Aug 2016 21:02:47 +0000
Subject: [Buildroot] [Bug 9176] minnowboard : USB not mounted
In-Reply-To: <bug-9176-163@https.bugs.busybox.net/>
References: <bug-9176-163@https.bugs.busybox.net/>
Message-ID: <bug-9176-163-2dtXRXXj6M@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9176

--- Comment #5 from CB <christophebricout@yahoo.fr> ---
Dear Yann and Ezequiel,

According to yours remarks, I made some more investigation.
The problem is solved!
Indeed, the default Kernel configuration for minnowboard was not handling USB.
After uptadting the kernel configuration (see attachment), I succeeded mount
the USB devices manually.

So, I think it could interessting to updqte the default configuration in order
to match minnowboard. Up to you.

Anyway, thanks for your help
Best regards
Christophe

-- 
You are receiving this mail because:
You are on the CC list for the bug.
