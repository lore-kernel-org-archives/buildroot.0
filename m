From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 09:46:10 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915094610.3A7827FAA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #9 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-09-15 09:46:10 UTC ---
(In reply to comment #7)
> What is your use case for needing it?

I think he is loading a new kernel image using "kexec --load", and then he
wants to reboot the board in order to boot with that kernel image, which should
be able to do it with "kexec --exec", without calling shutdown.

Dr I J Ormshaw, please confirm.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
