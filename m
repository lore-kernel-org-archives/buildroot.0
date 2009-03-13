From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Mar 2009 19:33:36 +0000 (UTC)
Subject: [Buildroot] [Bug 181] Update to Xorg 7.4
In-Reply-To: <bug-181-163@https.bugs.busybox.net/>
References: <bug-181-163@https.bugs.busybox.net/>
Message-ID: <20090313193336.391C27613B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=181


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org>  2009-03-13 19:33:35 UTC ---
Thanks a bunch, but it doesn't apply to svn trunk. What tree is this against?

I get:

error: patch failed:
package/x11r7/xserver_xorg-server/xserver_xorg-server.mk:43
error: package/x11r7/xserver_xorg-server/xserver_xorg-server.mk: patch does not
apply
error:
package/x11r7/xserver_xorg-server/xserver_xorg-server-1.4-pkgconfig-fix.patch:
No such file or directory
error: package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch: No such file or
directory


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
