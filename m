From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Dec 2010 16:56:25 +0000 (UTC)
Subject: [Buildroot] [Bug 2995] -fstack-protector-all causes ssh to SIGSEGV
In-Reply-To: <bug-2995-163@https.bugs.busybox.net/>
References: <bug-2995-163@https.bugs.busybox.net/>
Message-ID: <20101220165625.551F48DFCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2995

--- Comment #3 from Mario Klebsch <mario@klebsch.de>  ---
(In reply to comment #2)
> Where can I find this option? I think, I searched all menuconfig branches, but
> was unable to find this option. I anso grep'ed all Config.in's for "Enable
> stack protection support" and for BR2_TOOLCHAIN_BUILDROOT_USE_SSP, but I cannot
> find this entry. :-(

I finally found it in toolchain/toolchain-buildroot/Config.in.2

The compiler is still running...

73, Mario

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
