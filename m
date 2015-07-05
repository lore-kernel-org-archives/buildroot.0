From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  5 Jul 2015 14:46:13 +0000 (UTC)
Subject: [Buildroot] [Bug 8201] Important security upgrades for node.js
In-Reply-To: <bug-8201-163@https.bugs.busybox.net/>
References: <bug-8201-163@https.bugs.busybox.net/>
Message-ID: <20150705144613.D52EF81767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8201

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-07-05 14:46:13 UTC ---
Chris,

Thanks for the patch!

The normal process for submitting patches isa to send them to the list,
like explained in the manual:
    http://buildroot.net/downloads/manual/manual.html#submitting-patches

However, I can already spot some issues with the patch: when you use
git-send-email, use the -C option, so that files that are only renamed
(or moved to another directory) only appear as a git rename, please?

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
