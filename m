From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jan 2014 22:59:33 +0000 (UTC)
Subject: [Buildroot] [Bug 6752] genext2fs: e2fsck must run before tunefs -U
	random
In-Reply-To: <bug-6752-163@https.bugs.busybox.net/>
References: <bug-6752-163@https.bugs.busybox.net/>
Message-ID: <20140105225933.614829C3D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6752

--- Comment #7 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-01-05 22:59:33 UTC ---
Daniel,

This should be fixed by:
    http://patchwork.ozlabs.org/patch/307025/

Care to check on your side, please?

Thanks again for the report!

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
