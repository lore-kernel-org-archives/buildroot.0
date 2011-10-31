From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Oct 2011 13:45:06 +0000 (UTC)
Subject: [Buildroot] [Bug 4363] Make sure that copied linux and busybox
 defconfig are writable before modifying
In-Reply-To: <bug-4363-163@https.bugs.busybox.net/>
References: <bug-4363-163@https.bugs.busybox.net/>
Message-ID: <20111031134506.8E3268F3B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4363

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2011-10-31 13:45:06 UTC ---
I really don't understand why this would be necessary. Could you detail what
you mean by "If the custom defconfigs are not checked out, then they are
read-only" ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
