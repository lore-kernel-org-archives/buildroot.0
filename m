From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  1 Sep 2010 08:18:46 +0000 (UTC)
Subject: [Buildroot] [Bug 2479] host-module-init-tools 3.11 fails to build
In-Reply-To: <bug-2479-163@https.bugs.busybox.net/>
References: <bug-2479-163@https.bugs.busybox.net/>
Message-ID: <20100901081846.C72C08A3EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2479

--- Comment #1 from Nazarenko Nikita <nnazarenko@radiofid.ru>  ---
Created attachment 2419
  --> https://bugs.busybox.net/attachment.cgi?id=2419
fix for m4 script which generate broken configure script

This patch work for me, but I'm not sure in correctness

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
