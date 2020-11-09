From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 09 Nov 2020 19:27:13 +0000
Subject: [Buildroot] [Bug 13306] wpewebkit build problem in 2020-11-rc1
In-Reply-To: <bug-13306-163@https.bugs.busybox.net/>
References: <bug-13306-163@https.bugs.busybox.net/>
Message-ID: <bug-13306-163-3CeUP3bLVE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13306

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Is this a regression to a previous version (if yes which one buildroot and/or
wpewebkit) or is is specific to your buildroot .config/defconfig?

Could you try with reverting  the last ([1]) and/or the last two ([2]) version
bumps?

Can your provide the failing buildroot .config/defconfig?

[1]
https://git.buildroot.net/buildroot/commit/?id=6fdfd5326ab4825366214338c3a46c486d086fe6
[2]
https://git.buildroot.net/buildroot/commit/?id=371f6744e5d88669af8d26b73683b4302f7a7d5a

-- 
You are receiving this mail because:
You are on the CC list for the bug.
