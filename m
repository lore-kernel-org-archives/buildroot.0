From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Jul 2009 19:27:15 +0000 (UTC)
Subject: [Buildroot] [Bug 301] allow to install libsmbclient
In-Reply-To: <bug-301-163@https.bugs.busybox.net/>
References: <bug-301-163@https.bugs.busybox.net/>
Message-ID: <20090726192715.6416A777FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=301


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-26 19:27:14 UTC ---
hmm, the $(TARGET_DIR)/$(SAMBA_TARGET_BINARY) target already calls make
installlibs, I take it that should either get removed or the new libsmbclient
target isn't really needed?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
