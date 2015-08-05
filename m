From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2015 21:17:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150805211750.E3F1181E7F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-08-05 21:17:50 UTC ---
Why are you using 'gmake' instead of 'make' ? Are you perhaps building on a
non-Linux system? If so, which one?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
