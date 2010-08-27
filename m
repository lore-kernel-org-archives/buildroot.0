From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Aug 2010 09:17:41 +0000 (UTC)
Subject: [Buildroot] [Bug 2443] Initramfs: Don't overwrite
 $(TARGET_DIR)/init if it exists
In-Reply-To: <bug-2443-163@https.bugs.busybox.net/>
References: <bug-2443-163@https.bugs.busybox.net/>
Message-ID: <20100827091741.E51C48906E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2443

--- Comment #1 from Simon Pasch <fpasch@googlemail.com>  ---
Created attachment 2377
  --> https://bugs.busybox.net/attachment.cgi?id=2377
Patch

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
