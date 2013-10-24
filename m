From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2013 08:19:23 +0000 (UTC)
Subject: [Buildroot] [Bug 6596] Slow bootup if mdev is chosen
In-Reply-To: <bug-6596-163@https.bugs.busybox.net/>
References: <bug-6596-163@https.bugs.busybox.net/>
Message-ID: <20131024081923.112FC9BB9A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6596

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-10-24 08:19:22 UTC ---
We have had a discussion about this topic in the past:
http://lists.busybox.net/pipermail/buildroot/2013-July/075148.html

I indeed have noticed the same slowdown, and our solution was the same (setting
the UEVENT_HELPER to empty).

Given that the mentioned thread changed S10mdev to set mdev as helper after
boot, I don't think we still need/want the in-kernel option.

Would you mind sending this change as a proper patch to the mailing list,
including description and Signed-off-by? This would provide you with the
necessary credit, and also facilitates discussion on the patch.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
