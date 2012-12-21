From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Dec 2012 18:59:50 +0000 (UTC)
Subject: [Buildroot] [Bug 5810] Buildroot 2012.11: Additional GCC option
 "-msoft-float" breaks the build
In-Reply-To: <bug-5810-163@https.bugs.busybox.net/>
References: <bug-5810-163@https.bugs.busybox.net/>
Message-ID: <20121221185951.0A3FD9A388@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5810

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-12-21 19:00:13 UTC ---
So, you're explicitly passing:

BR2_EXTRA_GCC_CONFIG_OPTIONS="-msoft-float"

in your Buildroot configuration, and then you complain because GCC doesn't
understand your special flag? If you pass a special flag, aren't you supposed
to know what you're doing?

This seems like a curious bug report, isn't it ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
