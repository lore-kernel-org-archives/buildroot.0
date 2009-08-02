From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  2 Aug 2009 20:38:09 +0000 (UTC)
Subject: [Buildroot] [Bug 525] sed can't find libintl
In-Reply-To: <bug-525-163@https.bugs.busybox.net/>
References: <bug-525-163@https.bugs.busybox.net/>
Message-ID: <20090802203809.513FB777BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=525


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED




--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-08-02 20:38:08 UTC ---
Strange, I cannot reproduce it here (on an ARM config). Your config is kind of
strange, as you would normally not enable libintl if your toolchain has locale
support.
May I ask why you are not simply using the busybox sed applet instead? Most
buildroot users do, so that one sees a lot more testing (not that the big sed
shouldn't work)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
