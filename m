From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 14:22:21 +0000 (UTC)
Subject: [Buildroot] [Bug 2929] genext2fs: couldn't allocate a block (no
	free space)
In-Reply-To: <bug-2929-163@https.bugs.busybox.net/>
References: <bug-2929-163@https.bugs.busybox.net/>
Message-ID: <20130526142221.488B89A586@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2929

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
                 CC|                            |yann.morin.1998 at free.fr
         Resolution|                            |INVALID

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> 2013-05-26 14:21:11 UTC ---
Sean,

Estimating the number of blocks is done with a call to: 'du -k' where '-k'
means 'assume 1KiB blocks' (see: man du). So your issue is probably /slightly/
different.

If you manage to reproduce this issue, please reopen this bug and report back
with a bit more information: buildroot's .config file, host file system...

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
