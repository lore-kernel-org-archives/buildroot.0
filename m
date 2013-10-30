From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Oct 2013 22:21:24 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20131030222124.5B7B89BC02@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #10 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-10-30 22:21:24 UTC ---
The bug report never provided the .config, and I've again tested that Erlang
builds fine for ARM. Moreover, it's been a while since we haven't had an
autobuilder failure on erlang, as far as I can remember.

While there might probably be an issue, the bug report hasn't provided enough
detail to investigate. Feel free to reopen with more details (at the minimum
the tested Buildroot version *and* configuration file). Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
