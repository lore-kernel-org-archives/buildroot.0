From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  8 Oct 2010 06:07:59 +0000 (UTC)
Subject: [Buildroot] [Bug 2557] [PATCH] mkfs.xfs complains about missing
	libxfs.so.0
In-Reply-To: <bug-2557-163@https.bugs.busybox.net/>
References: <bug-2557-163@https.bugs.busybox.net/>
Message-ID: <20101008060759.E4A2B8C062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2557

Ossy <marcus.osdoba@googlemail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Priority|P5                          |P4
           Platform|PC                          |All
         AssignedTo|unassigned at buildroot.uclibc |marcus.osdoba at googlemail.co
                   |.org                        |m
           Severity|minor                       |normal

--- Comment #1 from Ossy <marcus.osdoba@googlemail.com>  ---
Xfsprogs currently uses the old infrastructure. I updated it to the newer
version 3.1.3 and autotargets. This version on xfsprogs may use the libuuid of
util-linux-ng (introduced in another patch) or the libuuid of e2fsxprogs (no
need of util-linux-ng).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
