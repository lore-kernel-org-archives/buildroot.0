From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 11:58:01 +0000 (UTC)
Subject: [Buildroot] [Bug 2095] make gconfig: undefined reference to symbol
 'dlsym@@GLIBC_2.2.5'
In-Reply-To: <bug-2095-163@https.bugs.busybox.net/>
References: <bug-2095-163@https.bugs.busybox.net/>
Message-ID: <20100624115801.1968381851@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2095

--- Comment #9 from Mitch Davis <mjd-busybox.net@afork.com>  ---
Now I understand (I think).

This is not a fix to find the link line for GTK+ apps in general.  Instead,
this fixes the problem where gconfig needs the dl library.  Now the fix looks
right to me :-)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
