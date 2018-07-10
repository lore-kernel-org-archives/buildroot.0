From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 10 Jul 2018 10:21:43 +0000
Subject: [Buildroot] [Bug 11141] WF111 package no longer availabe
In-Reply-To: <bug-11141-163@https.bugs.busybox.net/>
References: <bug-11141-163@https.bugs.busybox.net/>
Message-ID: <bug-11141-163-l8Bp6cxTR8@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11141

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org> ---
Ahh, ok. The mirroring gets a bit confused with these architecture/variant
specific tarballs. I had the tarball here locally, so I have copied it to
sources.buildroot.net as well.


With that said, it would be great if you could send a patch to the mailing list
bumping the version to -4 for the ARM variants. We already carry the needed
wpa_supplicant patches.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
