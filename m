From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Jun 2013 17:35:26 +0000 (UTC)
Subject: [Buildroot] [Bug 6326] Dropbear: Add options to allow better config
 for different target devices (e.g. routers)
In-Reply-To: <bug-6326-163@https.bugs.busybox.net/>
References: <bug-6326-163@https.bugs.busybox.net/>
Message-ID: <20130623173526.BFA829B13C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6326

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> 2013-06-23 17:33:39 UTC ---
Buildroot's #1 goal is to be simple yet flexible. Almost every package could
get configuration options like this, and they would hardly ever be used.

In addition, buildroot builds a complete and consistent rootfs (hence its
name). It is not buildroot's goal to cross-compile packages for addition to an
existing rootfs.

The xauth patch is necessary because that is where buildroot itself installs
xauth.

And to top things up, buildroot already makes it possible to achieve your goal
with the user patch directory.

So I second putting this in WONTFIX.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
