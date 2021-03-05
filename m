From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 05 Mar 2021 22:03:53 +0000
Subject: [Buildroot] [Bug 13581] jpegsrc.v9d.tar.gz has changed hash
In-Reply-To: <bug-13581-163@https.bugs.busybox.net/>
References: <bug-13581-163@https.bugs.busybox.net/>
Message-ID: <bug-13581-163-jKTHucd12X@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13581

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> ---
Sorry, we cannot do that. All Buildroot releases since January 2020 uses this
version and expects the old checksum. If we were to change the checksum, then
we would also have to change the copy on sources.buildroot.org, and that would
break all Buildoot releases expecting the old checksum.

Buildroot should automatically fallback to the copy on sources.buildroot.org
when it notices the wrong checksum from upstream, doesn't that work for you?

Please instead contact upstream and ask them to revert the checksum change
and/or release a v9e version that we could move to instead.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
