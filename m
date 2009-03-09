From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Mar 2009 20:22:18 +0000 (UTC)
Subject: [Buildroot] [Bug 163] Xtensa architecrute port
In-Reply-To: <bug-163-163@https.bugs.busybox.net/>
References: <bug-163-163@https.bugs.busybox.net/>
Message-ID: <20090309202218.9FDA27669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=163





--- Comment #1 from Maxim Grigoriev <maxim2405@gmail.com>  2009-03-09 20:22:16 UTC ---
Created an attachment (id=115)
 --> (https://bugs.busybox.net/attachment.cgi?id=115)
This is the first patch in a set of Xtensa port patches

      Xtensa BUILDROOT uses a concept of source overlays,
      which are necessary because Xtensa processors are
      configurable and extensible. Xtensa tools, e.g.
      gcc, gdb, and binutils, use source overlays, which
      can not be substituted by the current BUILDROOT
      patching mechanism. This update makes patch-kernel.sh
      script capable of handling these overlays.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
