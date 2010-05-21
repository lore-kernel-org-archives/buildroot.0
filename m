From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 May 2010 13:29:22 +0000 (UTC)
Subject: [Buildroot] [Bug 1759] qt.mk stops build to prompts user
In-Reply-To: <bug-1759-163@https.bugs.busybox.net/>
References: <bug-1759-163@https.bugs.busybox.net/>
Message-ID: <20100521132922.CCCF66A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1759

--- Comment #2 from Dave Smith <dave@thesmithfam.org>  ---
(In reply to comment #1)
> We already have the BR2_PACKAGE_QT_LICENSE_APPROVED option that automatically
> approves the license. Was this option set in your configuration ?

Thomas: My mistake. I didn't notice that option. Frankly, I didn't even think
to check it. That's a better way to handle it. Does menuconfig also allow you
to choose commercial vs. open source?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
