From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Jun 2014 09:11:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7166] hostapd: segfault when using RT5370
In-Reply-To: <bug-7166-163@https.bugs.busybox.net/>
References: <bug-7166-163@https.bugs.busybox.net/>
Message-ID: <20140604091133.A6D3A9CE85@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7166

Jonathan <jmavermeulen@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |NEW

--- Comment #2 from Jonathan <jmavermeulen@gmail.com> 2014-06-04 09:11:33 UTC ---
(In reply to comment #1)
> I don't know much about hostapd, but from the looks of it that patch seems
> trivial to backport to the 2.1 release, so we could add it as a patch in
> buildroot until the next hostapd release.
> 
> Care to send a patch doing that?

How can I make a patch based on the git diff? I'm really new to working with
buildroot and compiling kernel/rootfs in general.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
