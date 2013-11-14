From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 16:50:31 +0000 (UTC)
Subject: [Buildroot] [Bug 6692] GNU nano fails to compile for x86_64
In-Reply-To: <bug-6692-163@https.bugs.busybox.net/>
References: <bug-6692-163@https.bugs.busybox.net/>
Message-ID: <20131114165031.4AF3D9BCCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6692

--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-14 16:50:31 UTC ---
The libncursesw failure was detected and fixed in
http://git.buildroot.net/buildroot/commit/package/nano/nano.mk?id=f0801fa2f3e1cbd617bacef3b442da6914caae0a
Patch sent to the list about this issue, thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
