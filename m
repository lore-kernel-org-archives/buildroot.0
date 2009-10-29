From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Oct 2009 21:32:30 +0000 (UTC)
Subject: [Buildroot] [Bug 515] tcpreplay: new package
In-Reply-To: <bug-515-163@https.bugs.busybox.net/>
References: <bug-515-163@https.bugs.busybox.net/>
Message-ID: <20091029213230.7AA3D777B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=515


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-10-29 21:32:28 UTC ---
Hi, the patch basically looks good except for a few minor style issues
(identation in Config.in, not using sourceforge mirror variable for site, .. -
But that's not a big deal.

What is a showstopper though, is that the cross compile patch doesn't apply:

>>> tcpreplay 3.4.3 Downloading
>>> tcpreplay 3.4.3 Extracting
>>> tcpreplay 3.4.3 Patching libtool
>>> tcpreplay 3.4.3 Patching package/tcpreplay

Applying tcpreplay-3.4.3-010-cross-compile.patch using plaintext: 
patching file configure.ac
Hunk #3 FAILED at 480.
1 out of 5 hunks FAILED -- saving rejects to file configure.ac.rej
patching file configure
Patch failed!  Please fix tcpreplay-3.4.3-010-cross-compile.patch!
make: *** [/tmp/br/build/tcpreplay-3.4.3/.stamp_patched] Error 1

Could you fix this and resubmit?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
