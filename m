From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Oct 2009 21:59:42 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091018215942.5CF0177787@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #10 from Sven Neumann <s.neumann@raumfeld.com>  2009-10-18 21:59:41 UTC ---
The gvfs patches that I just sent to the mailing-list fix the problem described
in comment #6. It was indeed unrelated to your patch.

I've also sent an updated patch for samba to the mailing-list that has the
uclibc dependency and the call to autogen.sh dropped.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
