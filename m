From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Jun 2010 11:04:27 +0000 (UTC)
Subject: [Buildroot] [Bug 2095] make gconfig: undefined reference to symbol
 'dlsym@@GLIBC_2.2.5'
In-Reply-To: <bug-2095-163@https.bugs.busybox.net/>
References: <bug-2095-163@https.bugs.busybox.net/>
Message-ID: <20100624110428.05C4181976@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2095

--- Comment #7 from Slava Zanko <slavazanko@gmail.com>  ---
(In reply to comment #6)
> Actually, kconfig itself calls dlsym():

Is this mean, bug independ to GTK?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
