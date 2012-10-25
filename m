From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 25 Oct 2012 09:09:49 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
In-Reply-To: <bug-5624-163@https.bugs.busybox.net/>
References: <bug-5624-163@https.bugs.busybox.net/>
Message-ID: <20121025090949.10AFC99924@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

--- Comment #5 from Duncan <dunk_palmer@yahoo.com> 2012-10-25 09:09:47 UTC ---
Arnout, I've made the change you suggested to package/directfb/directfb.mk; now
directfb, and all the other packages I have selected, are building for me.
Patch against 2012.08 attached.

I'm not sure how many packages have the same problem as directfb; if there are
a few, then I'd imagine that a more robust solution may be to create a
toolchain wrapper for ld.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
