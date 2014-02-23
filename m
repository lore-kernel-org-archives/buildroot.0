From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 23 Feb 2014 14:43:27 +0000 (UTC)
Subject: [Buildroot] [Bug 5774] Not able to build ALSA-Utils for static build
In-Reply-To: <bug-5774-163@https.bugs.busybox.net/>
References: <bug-5774-163@https.bugs.busybox.net/>
Message-ID: <20140223144327.746FC9B838@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5774

Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-23 14:43:27 UTC ---
Although the problem can be solved with a patch like
http://patchwork.ozlabs.org/patch/319707/, we do not like to have such feature
patches in buildroot without them being accepted upstream. 
Please discuss the situation upstream on the alsa-devel mailing list. If the
patch can be accepted there, the buildroot build can be fixed with a version
bump.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
