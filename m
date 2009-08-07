From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 08:36:53 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20090807083653.71BBC7779D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545





--- Comment #2 from Sven Neumann <s.neumann@raumfeld.com>  2009-08-07 08:36:52 UTC ---
Instead of patching packages, perhaps buildroot should include gtkdocize?
Patching packages is always a pain as the patches will likely have to be
adjusted whenever the package is updated. If buildroot would include a
gtkdocize command that installs gtk-doc.m4 and gtk-doc.make, no package would
have to be patched. The gtk-doc.m4 and gtk-doc.make files could even be just
stubs that disable the build of the documentation. Than we wouldn't even have
to pass --disable-gtk-doc to the configure scripts.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
