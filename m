From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 14 Nov 2014 10:29:37 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20141114102937.3BD78B0C61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

--- Comment #7 from tobias.meggendorfer+buildroot at gmail.com 2014-11-14 10:29:36 UTC ---
Again, _ssl* missing in target but present in host. See line 61876, "The
necessary bits to build these optional modules were not found:"

I uploaded this compressed file to my gdrive, the uncompressed log has ~23 mb,
which probably does not get accepted by any pastebin-ish hoster.
https://drive (dot) google (dot)
com/file/d/0BwB7SQYhX6MuZlIwYXdjSDZnZzA/view?usp=sharing

Note: /project is a symlink to /var/data/project on my filesystem (buildroot is
too big for my root partition). I just tried compiling after switching to the
"real" path, just in case, but same result.

I used the config mentioned in comment 4

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
