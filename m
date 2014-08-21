From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 21 Aug 2014 20:21:28 +0000 (UTC)
Subject: [Buildroot] [Bug 7322] libgomp dependency issue with imagemagick
In-Reply-To: <bug-7322-163@https.bugs.busybox.net/>
References: <bug-7322-163@https.bugs.busybox.net/>
Message-ID: <20140821202128.D80199D4A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7322

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #6 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-21 20:21:27 UTC ---
Workaround committed:
http://git.buildroot.org/buildroot/commit/?id=9579e6aac33aa828aa5a447727440be7b85efb03

Longer term solutions will be submitted through the mailing list, so marking
this as fixed.

Thanks for reporting!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
