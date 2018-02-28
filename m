From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Feb 2018 10:11:52 +0000
Subject: [Buildroot] [Bug 10811] kodi-17.6-Krypton does not compile for
 freescale_* devices
In-Reply-To: <bug-10811-163@https.bugs.busybox.net/>
References: <bug-10811-163@https.bugs.busybox.net/>
Message-ID: <bug-10811-163-tj79X2ioLK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10811

--- Comment #2 from Ossi Syri <ossisyri@gmail.com> ---
Thanks, I found your case earlier also.

This exact patch did not help.

(make kodi-dirclean ; make)

Maybe Bernd your point was not exact patch but something to apply same way.. My
knowledge of kodi is not enought to decide what.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
