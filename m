From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  2 Mar 2015 08:01:39 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150302080139.52F0D7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #11 from nroach44 at gmail.com 2015-03-02 08:01:39 UTC ---
(In reply to comment #10)
> (In reply to comment #9)
> 
> Ok, interesting. What is the difference in Buildroot configuration between this
> and your sama5d3-xplained config?
> 
Quite a bit as my config has a lot of packages, but I couldn't spot anything
that would make a difference. I'll attach it. The permissions and user table
should be the same as the x86 system's.
> 
> Ok, I'll give qemu_x86_defconfig a try. What file system are you using?

ext2 on the sama and ext4 on the x86.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
