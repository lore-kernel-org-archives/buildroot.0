From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Mar 2009 17:14:04 +0000 (UTC)
Subject: [Buildroot] [Bug 65] new package: dbus c++ language bindings
In-Reply-To: <bug-65-163@https.bugs.busybox.net/>
References: <bug-65-163@https.bugs.busybox.net/>
Message-ID: <20090325171404.951B0771E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=65


rhunger at gmx.ch changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rhunger at gmx.ch




--- Comment #3 from rhunger at gmx.ch  2009-03-25 17:14:04 UTC ---
(In reply to comment #1)
> i don't quite like the git handling as there's no control of what revision
> you're downloading.

That's right, I don't like it neither.

There is still no tag/version from upstream. It seams, that they are
currently merging in some changes from another git tree.
I think this will take some time.

I reworked my patch to explicitly reference a git commit tree "version".
This way it would be easy to change to an official upstream version number.

Regards
Robert


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
