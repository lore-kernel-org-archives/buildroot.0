From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 Jul 2009 04:05:14 +0000 (UTC)
Subject: [Buildroot] [Bug 477] Add sdl_sound package
In-Reply-To: <bug-477-163@https.bugs.busybox.net/>
References: <bug-477-163@https.bugs.busybox.net/>
Message-ID: <20090728040514.B9D09777D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=477





--- Comment #2 from Evan Zelkowitz <evan.zelkowitz@gmail.com>  2009-07-28 04:05:13 UTC ---
Created an attachment (id=505)
 --> (https://bugs.busybox.net/attachment.cgi?id=505)
sdl_snd patch

Patch to add sdl_snd as an option under the sdl options in package selection. 
Hopefully this patch is ok, I just did a diff against a fresh git and a fresh
one with the new option.  It diffed a few of the binary git files, but since
they were binary and just ended up as notifications in the patch I figured they
were harmless.  Is there an official doc/faq/whatever about the patch
submission process or any sort of standards for spacing on what not?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
