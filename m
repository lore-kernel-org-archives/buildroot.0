From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Jul 2010 20:35:36 +0000 (UTC)
Subject: [Buildroot] [Bug 387] Tremor not installed to toolchain
In-Reply-To: <bug-387-163@https.bugs.busybox.net/>
References: <bug-387-163@https.bugs.busybox.net/>
Message-ID: <20100718203536.953B982BB1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=387

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|                            |FIXED

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org>  ---
I believe this is resolved by Svens addition of the
BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_TREMOR option (63dd44dbcdc6eb8) - If not,
please reopen the bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
