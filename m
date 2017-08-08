From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 08 Aug 2017 14:04:20 +0000
Subject: [Buildroot] [Bug 10176] Rsyslog's S01logging is deleted by
 Busybox.mk from TARGET
In-Reply-To: <bug-10176-163@https.bugs.busybox.net/>
References: <bug-10176-163@https.bugs.busybox.net/>
Message-ID: <bug-10176-163-XePqnipdGa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10176

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
Your analysis seems correct. Could you send the patch to the mailing list, as
per the contribution guidelines? See
https://buildroot.org/downloads/manual/manual.html#submitting-patches

You also need to do the following.

- Add your Signed-off-by line. This is a short way for you to assert that you
are entitled to contribute the patch under Buildroot's GPL license.  See 
http://elinux.org/Developer_Certificate_Of_Origin for more details.

- Make it a git-formatted patch.

- Add a note "Fixes https://bugs.busybox.net/show_bug.cgi?id=10176"

Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
