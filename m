From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Aug 2013 09:57:28 +0000 (UTC)
Subject: [Buildroot] [Bug 6092] Bootable ISO image creation seems to have
 stopped working since 2012.08
In-Reply-To: <bug-6092-163@https.bugs.busybox.net/>
References: <bug-6092-163@https.bugs.busybox.net/>
Message-ID: <20130826095729.0DC0C9B53B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6092

--- Comment #8 from Sven Neumann <s.neumann@raumfeld.com> 2013-08-26 09:57:51 UTC ---
(In reply to comment #6)
> Did you had the time to test the proposed patch?

We have run into this problem today when trying to create a bootable ISO image
of our firmware for use on our continuous integration server. We are using the
2013.05 release with gcc 4.7.

I've applied the patch that bumps grub to 0.97-67 but the boot still hangs at
"Loading Stage2 ....."

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
