From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  8 Feb 2014 20:56:57 +0000 (UTC)
Subject: [Buildroot] [Bug 4339] Allow override of DL_DIR in extract step
In-Reply-To: <bug-4339-163@https.bugs.busybox.net/>
References: <bug-4339-163@https.bugs.busybox.net/>
Message-ID: <20140208205657.2ED8E9C6D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4339

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-08 20:56:56 UTC ---
Can you provide more details as to what you are trying to achieve, and how?
If you are simply setting DL_DIR from the .mk file of an individual package,
this won't work as expected because all subsequent packages will now have that
DL_DIR too (non-recursive make).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
