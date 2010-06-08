From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jun 2010 03:39:29 +0000 (UTC)
Subject: [Buildroot] [Bug 1723] [PATCH] axel: convert to autotools
	infrastructure
In-Reply-To: <bug-1723-163@https.bugs.busybox.net/>
References: <bug-1723-163@https.bugs.busybox.net/>
Message-ID: <20100608033929.3435888CC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1723

--- Comment #3 from Kelvin Cheung <keguang.zhang@gmail.com>  ---
Created attachment 1945
  --> https://bugs.busybox.net/attachment.cgi?id=1945
convert to generic package infrastructure and bump to version 2.4

axel uses a handwritten configure script, not autotools.
So, I have to convert it to generic package.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
