From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 09:53:25 +0000 (UTC)
Subject: [Buildroot] [Bug 505] live555: new package
In-Reply-To: <bug-505-163@https.bugs.busybox.net/>
References: <bug-505-163@https.bugs.busybox.net/>
Message-ID: <20090730095325.7F4637781B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=505





--- Comment #2 from Will Newton <will.newton@gmail.com>  2009-07-30 09:53:24 UTC ---

This rule in the makefile looks wrong to me:

$(STAGING_DIR)/usr/include/live: $(LIVE555_DIR)/liveMedia/libliveMedia.a
        cp -a $(LIVE555_DIR) $(STAGING_DIR)/usr/include/

The whole source tree is copied into /usr/include in the staging_dir?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
