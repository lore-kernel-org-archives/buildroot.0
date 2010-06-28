From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 28 Jun 2010 16:54:17 +0000 (UTC)
Subject: [Buildroot] [Bug 2119] Tries to build kernel,
	although disabled in config
In-Reply-To: <bug-2119-163@https.bugs.busybox.net/>
References: <bug-2119-163@https.bugs.busybox.net/>
Message-ID: <20100628165417.D9D5A81813@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2119

--- Comment #5 from jsteckli at os.inf.tu-dresden.de  ---
Actually that (building initramfs without kernel) was working fine for a while
and I was using it. So the fix destroys a feature for me. Is this by design?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
