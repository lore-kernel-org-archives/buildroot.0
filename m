From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 22:07:03 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150604220703.1A02181E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-06-04 22:07:02 UTC ---
Created attachment 6046
  --> https://bugs.busybox.net/attachment.cgi?id=6046
Rough tentative for a fix

Thomas,

This is definitely not the final patch, but a tentative
to get your use-case working.

This will have to be refined for a final solution (like,
splitting the merge-config.sh fix to a separate patch).

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
