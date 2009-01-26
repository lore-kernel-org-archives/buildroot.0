From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Jan 2009 21:19:13 +0000 (UTC)
Subject: [Buildroot] [Bug 73] Bump openssl package to the latest version
In-Reply-To: <bug-73-163@https.bugs.busybox.net/>
References: <bug-73-163@https.bugs.busybox.net/>
Message-ID: <20090126211913.D451D7672B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=73





--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-01-26 21:19:12 UTC ---
The patch is big because of patch file renaming.
Basically it's only that plus s/0.9.8g/0.9.8j/ and the change to openssldir in
the .mk file.
Probably better to apply after release, just remember it later ;-)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
