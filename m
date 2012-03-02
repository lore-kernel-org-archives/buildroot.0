From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  2 Mar 2012 15:46:38 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120302154638.2F0E790C0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-03-02 15:46:37 UTC ---
Could you send a proper git-formatted patch to the mailing list, so that your
authorship can be preserved? It would also be nice to expand a little bit the
comment above the _CONF_OPT line, because the issue is not completely trivial,
and I'm quite sure we'll wonder ourselves in the future why we did that.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
