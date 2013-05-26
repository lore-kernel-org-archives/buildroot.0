From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 17:06:22 +0000 (UTC)
Subject: [Buildroot] [Bug 5462] webkit doesn't build on directfb
In-Reply-To: <bug-5462-163@https.bugs.busybox.net/>
References: <bug-5462-163@https.bugs.busybox.net/>
Message-ID: <20130526170622.1AC199A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5462

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 17:05:12 UTC ---
We have deprecated the DirectFB backend of Gtk, because it is unmaintained
upstream, and it has been causing build issues for quite some time. Therefore,
Gtk-Webkit on top of DirectFB is mostly dead, unless someone steps up with the
corresponding upstream projects to maintain the DirectFB backend.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
