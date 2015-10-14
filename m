From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 09:44:19 +0000 (UTC)
Subject: [Buildroot] [Bug 8321] invalid opcode error with minidlna and ffmpeg
In-Reply-To: <bug-8321-163@https.bugs.busybox.net/>
References: <bug-8321-163@https.bugs.busybox.net/>
Message-ID: <20151014094419.9A2BD81D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8321

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-14 09:44:19 UTC ---
Could you indicate what is your exact Buildroot configuration (attach your
.config), and the exact hardware you're running on?

Also, can you build the Buildroot system with debugging symbols, generate a
core dump on the target, and then look at the backtrace with gdb?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
