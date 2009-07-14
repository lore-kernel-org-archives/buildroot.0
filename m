From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2009 13:03:33 +0000 (UTC)
Subject: [Buildroot] [Bug 455] Fontconfig problem problem when
	building/installing
In-Reply-To: <bug-455-163@https.bugs.busybox.net/>
References: <bug-455-163@https.bugs.busybox.net/>
Message-ID: <20090714130333.8B930777D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455





--- Comment #7 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-07-14 13:03:32 UTC ---
(In reply to comment #6)
> > Yes, I have an $(STAGING_DIR)/bin/sh installed.
> 
> Ohh? Where does that come from - Bash? That sounds like a bug in the first
> place
> 

That's copied from the external toolchain.
Whatever is in the staging we shouldn't have that kind of problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
