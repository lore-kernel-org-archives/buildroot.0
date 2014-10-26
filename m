From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Oct 2014 18:06:33 +0000 (UTC)
Subject: [Buildroot] [Bug 7556] make interactive CLI optional for nftables
In-Reply-To: <bug-7556-163@https.bugs.busybox.net/>
References: <bug-7556-163@https.bugs.busybox.net/>
Message-ID: <20141026180633.CFC4CAD9F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7556

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-10-26 18:06:33 UTC ---
Since this is really a feature patch, we generally prefer to not have it in
Buildroot. Can you instead send your patch to the nftables maintainers, and
then once accepted, send the appropriate patch to Buildroot?

By the way, we prefer to see patches posted on the mailing list. See
http://buildroot.org/downloads/manual/manual.html#submitting-patches for
details.

Thanks a lot!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
