From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  6 Dec 2011 20:18:37 +0000 (UTC)
Subject: [Buildroot] [Bug 4327] I use the i686-linux-gcc-4.6.1 compiled
 grub-0.97 does not work
In-Reply-To: <bug-4327-163@https.bugs.busybox.net/>
References: <bug-4327-163@https.bugs.busybox.net/>
Message-ID: <20111206201837.96E788F7CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4327

--- Comment #2 from Jaap Crezee <jaap@jcz.nl> 2011-12-06 20:18:36 UTC ---
Same problem over here when using buildroot-2011.11, selecting gcc-4.6.x and
'using' buildroot compiled grub.
The generated file stage2 seems corrupt (it is not recognized as being a grub
component by 'file' which works fine on other systems with grub 0.97)...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
