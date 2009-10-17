From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Oct 2009 21:51:56 +0000 (UTC)
Subject: [Buildroot] [Bug 665] [PATCH] Samba package
In-Reply-To: <bug-665-163@https.bugs.busybox.net/>
References: <bug-665-163@https.bugs.busybox.net/>
Message-ID: <20091017215157.0CA0F77726@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=665





--- Comment #1 from Sven Neumann <s.neumann@raumfeld.com>  2009-10-17 21:51:56 UTC ---
I tried to apply this patch to an uptodate git clone, but the patch did not
apply:

error: patch failed: package/samba/Config.in:8
error: package/samba/Config.in: patch does not apply
error: patch failed: package/samba/samba.mk:3
error: package/samba/samba.mk: patch does not apply


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
