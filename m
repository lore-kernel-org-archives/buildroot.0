From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 14 Oct 2015 14:55:15 +0000 (UTC)
Subject: [Buildroot] [Bug 8281] pyrexc fails to run when path is too long
In-Reply-To: <bug-8281-163@https.bugs.busybox.net/>
References: <bug-8281-163@https.bugs.busybox.net/>
Message-ID: <20151014145515.4812880105@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8281

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-10-14 14:55:15 UTC ---
Fixed by
http://git.buildroot.net/buildroot/commit/?id=fd43cadc6bf0c814d30ac0112ddf31ee5e72af5b.
Thanks for the report!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
