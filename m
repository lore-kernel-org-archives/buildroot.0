From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 10:42:33 +0000 (UTC)
Subject: [Buildroot] [Bug 2095] make gconfig: undefined reference to symbol
 'dlsym@@GLIBC_2.2.5'
In-Reply-To: <bug-2095-163@https.bugs.busybox.net/>
References: <bug-2095-163@https.bugs.busybox.net/>
Message-ID: <20100624104233.6F38B81975@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2095

--- Comment #4 from Slava Zanko <slavazanko@gmail.com>  ---
(In reply to comment #3)
> Patch in kernel notwithstanding, if gtk-2.0 apps need -ldl, I'm wondering why
> it's not included in the output of pkg-config --libs gtk+-2.0?

May be, need to fill bugreport in GTK bugzilla instread of patching kernel,
buildroot etc...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
