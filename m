From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Apr 2015 12:15:45 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150412121545.7A00580444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #9 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-04-12 12:15:45 UTC ---
Can you look at config.log in the strace build dir and see what
commands are run when checking for bluetooth.h ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
