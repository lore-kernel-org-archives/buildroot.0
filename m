From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 25 Feb 2009 19:52:23 +0000 (UTC)
Subject: [Buildroot] [Bug 99] new package: flac
In-Reply-To: <bug-99-163@https.bugs.busybox.net/>
References: <bug-99-163@https.bugs.busybox.net/>
Message-ID: <20090225195223.991687669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=99


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org>  2009-02-25 19:52:22 UTC ---
Thanks, applied libflac and gstreamer patches. I've updated libsndfile so it
builds with libflac instead of your workaround.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
