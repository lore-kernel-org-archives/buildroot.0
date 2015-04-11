From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 11 Apr 2015 18:44:01 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150411184401.05F1380E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #6 from Jaap Crezee <jaap@jcz.nl> 2015-04-11 18:44:00 UTC ---
We are working with an Intel Galileo gen2 board.
Intel states you should use Yocto.
The reason we are all still here (probably) is because we do NOT like Yocto, or
at least I do not like it. I think it is way to bloated.
Because I could not find a suitable toolchain, I built one myself.

My guess would be that it is not the toolchain which is broken, it has no
header files whatsoever regarding any bluetooth headers.

I am using the same toolchain for a "full-blown" rootfs (the one from this bug
is only for initramfs); it works quite well there. But in that case I also
enabled bluez5....

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
