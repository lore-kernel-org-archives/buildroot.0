From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 20:53:36 +0000 (UTC)
Subject: [Buildroot] [Bug 525] sed can't find libintl
In-Reply-To: <bug-525-163@https.bugs.busybox.net/>
References: <bug-525-163@https.bugs.busybox.net/>
Message-ID: <20090802205336.ACF1F777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=525





--- Comment #6 from Daniele Salvatore Albano <d.albano@gmail.com>  2009-08-02 20:53:36 UTC ---
I'd prefer to don't use busybox because i'm building an generic appliance root
for non embed machines: i need some stuff that busybox can't supply so, to use
it, i should mix too much busybox with non-busybox stuff so i'd preferred to
don't use it at all.

Libintl is selected for dependency, if i don't remember bad, but i cannot check
now, i've shutdown my compile station, i'll check tommorrow.

I'm using an external toolchain, based on glibc 2.9 and kernel 2.6.29.4, to do
the build, can this be the problem? I'm using crosstool-ng to build the
toolchain.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
