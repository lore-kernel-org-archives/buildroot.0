From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 13 Mar 2009 22:40:18 +0000 (UTC)
Subject: [Buildroot] [Bug 181] Update to Xorg 7.4
In-Reply-To: <bug-181-163@https.bugs.busybox.net/>
References: <bug-181-163@https.bugs.busybox.net/>
Message-ID: <20090313224018.F18737645B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=181





--- Comment #3 from Dan Lykowski <lykowdk@gmail.com>  2009-03-13 22:40:18 UTC ---
Hmmm..

xserver_xorg-server-1.4-pkgconfig-fix.patch
is a patch I submitted to fix the problem with xdrivers not compiling "Bug
#177".
It snuck in my build..

package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch
is just randomly broken.. It worked on my machine at home.
Here at work it makes patch puke..
So.. I'll remove it.

package/x11r7/xapp_xauth/xapp_xauth-1.0.2-xcb.patch
just needs to be renamed to 
package/x11r7/xapp_xauth/xapp_xauth-1.0.3-xcb.patch


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
