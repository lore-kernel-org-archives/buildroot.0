From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 27 Jul 2010 21:53:14 +0000 (UTC)
Subject: [Buildroot] [Bug 543] ATK requires X11 on DirectFB target
In-Reply-To: <bug-543-163@https.bugs.busybox.net/>
References: <bug-543-163@https.bugs.busybox.net/>
Message-ID: <20100727215314.5F74B83458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=543

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I just tested: I can successfully build a Gtk/ATK/Glib/Pango/Cairo stack on top
of DirectFB without any X11 component. In addition to that, the bug is more
than 6 months old without any detail provided.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
