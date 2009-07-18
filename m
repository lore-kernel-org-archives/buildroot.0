From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Jul 2009 14:08:30 +0000 (UTC)
Subject: [Buildroot] [Bug 453] libglib2 autoreconf
In-Reply-To: <bug-453-163@https.bugs.busybox.net/>
References: <bug-453-163@https.bugs.busybox.net/>
Message-ID: <20090718140830.B15D0777EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=453





--- Comment #8 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-07-18 14:08:29 UTC ---
(In reply to comment #7)
> http://git.gnome.org/cgit/glib/commit/?id=ea536503331aea875e84ae598b4610fbd059f167
> doesn't seem to exist. Am I looking at the wrong place ?
> 

I was giving you a buildroot hash, I think you missed something.

Most of packages using gtk-doc (libglib2, libgtk2, etc...) to generate their
documentation need the gtk-doc m4 macros to be reconfigured. This patch adds
the gtk-doc m4 that are not available because gtk-doc is not a part of
buildroot.

Regards,


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
