From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 06 Mar 2021 10:14:49 +0000
Subject: [Buildroot] [Bug 13581] jpegsrc.v9d.tar.gz has changed hash
In-Reply-To: <bug-13581-163@https.bugs.busybox.net/>
References: <bug-13581-163@https.bugs.busybox.net/>
Message-ID: <bug-13581-163-zrNGbMpLaT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13581

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED
         Resolution|WONTFIX                     |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Hi,

As a workaround, we've changed the libjpeg package to fetch the tarball from
the Buildroot source mirror until we update to a new release:

https://git.buildroot.org/buildroot/commit/?id=b83184de674a6d68e110d5666685edb0a7374d74

-- 
You are receiving this mail because:
You are on the CC list for the bug.
