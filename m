From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 15 Aug 2010 16:17:41 +0000 (UTC)
Subject: [Buildroot] [Bug 2389] Generate a Makefile wrapper in $(O)
In-Reply-To: <bug-2389-163@https.bugs.busybox.net/>
References: <bug-2389-163@https.bugs.busybox.net/>
Message-ID: <20100815161741.5A2B788CBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2389

--- Comment #1 from Yann E. MORIN <yann.morin.1998@anciens.enib.fr>  ---
Created attachment 2341
  --> https://bugs.busybox.net/attachment.cgi?id=2341
Install a Makefile wrapper in $(O)

This is highly inspired by how the Linux kernel does it. As our infra is not
really similar, there are significant differences.

Tested that it does not break current behavior (out-of-tree and in-tree).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
