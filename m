From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 31 Aug 2009 07:59:19 +0000 (UTC)
Subject: [Buildroot] [Bug 301] allow to install libsmbclient
In-Reply-To: <bug-301-163@https.bugs.busybox.net/>
References: <bug-301-163@https.bugs.busybox.net/>
Message-ID: <20090831075919.8D0527773A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=301





--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-31 07:59:18 UTC ---
(In reply to comment #2)
> hmm, the $(TARGET_DIR)/$(SAMBA_TARGET_BINARY) target already calls make
> installlibs, I take it that should either get removed or the new libsmbclient
> target isn't really needed?

Ping?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
