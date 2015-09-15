From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 09:42:19 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915094219.D371E7FFC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #8 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-09-15 09:42:19 UTC ---
By the way, is this helpful for you?

http://unix.stackexchange.com/questions/37323/kexec-from-within-initramfs

From the kexec man page:

-e (--exec)
      Run the currently loaded kernel. Note that it will  reboot  into
      the loaded kernel without calling shutdown(8).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
