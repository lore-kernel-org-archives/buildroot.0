From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Apr 2012 02:28:57 +0000 (UTC)
Subject: [Buildroot] [Bug 5144] Patch to fix ixon bug in uemacs
In-Reply-To: <bug-5144-163@https.bugs.busybox.net/>
References: <bug-5144-163@https.bugs.busybox.net/>
Message-ID: <20120427022857.D42CA96BE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5144

--- Comment #1 from Grant Edwards <grant.b.edwards@gmail.com> 2012-04-27 02:28:57 UTC ---
Created attachment 4304
  --> https://bugs.busybox.net/attachment.cgi?id=4304
The patch file that's added to the uemacs package by the first patch I sent.

uemacs-4.0.15lt.03.patch is the new patch file that is added to the
uemacs package directory by the patch file buildroot-uemacs-ixon-patch.patch.

I wasn't sure if adding a patch file to a package was best done by
submitting the new patch file itself, or by submitting a patch file
that adds the patch file -- I don't what the maintainers git workflow
is like.

So I attached both...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
