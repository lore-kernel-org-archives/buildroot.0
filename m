From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 19:44:26 +0000 (UTC)
Subject: [Buildroot] [Bug 1141] BusyBox based initramfs generation
In-Reply-To: <bug-1141-163@https.bugs.busybox.net/>
References: <bug-1141-163@https.bugs.busybox.net/>
Message-ID: <20100607194427.0EE65816D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1141

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #2)
> Peter, do we really want to go this way, and make Buildroot support the fact of
> creating two separate filesystems: one small initramfs and one "normal" root
> filesystem containing all libraries and applications ?
> 
> With a first look, I'd tempted to say "no" : just use Buildroot twice, once to
> build your initramfs and once to build your real root filesystem. But this is
> something that can be discussed, of course.

No, I agree with you.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
