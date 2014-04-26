From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Apr 2014 21:55:14 +0000 (UTC)
Subject: [Buildroot] [Bug 6944] building toolchain for sh4 fails
In-Reply-To: <bug-6944-163@https.bugs.busybox.net/>
References: <bug-6944-163@https.bugs.busybox.net/>
Message-ID: <20140426215514.98BB99CA08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6944

--- Comment #7 from George <gdalex@gmail.com> 2014-04-26 21:55:13 UTC ---
Hi Thomas,

with my little patch, I was able to have a toolchain capable of building the
whole rootfs for my board.

I did not use the BR2_EXTRA_GCC_CONFIG_OPTIONS, and to be honest, I don't
understand why I'd need those.

I don't know what else to say. It works in my case, but I don't know if there
are other cases that might not work.


Cheers
George

(In reply to comment #6)
> Hi George,
> 
> Did you already find some time to look into this further?
> 
> Thanks a lot,
> ThomasDS

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
