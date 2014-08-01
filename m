From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  1 Aug 2014 17:22:44 +0000 (UTC)
Subject: [Buildroot] [Bug 7172] Name collision of rpath token expansion and
 internal variables
In-Reply-To: <bug-7172-163@https.bugs.busybox.net/>
References: <bug-7172-163@https.bugs.busybox.net/>
Message-ID: <20140801172244.D92819D372@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7172

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #17 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-01 17:22:43 UTC ---
Bug closed after documentation and workaround commits:

http://git.buildroot.org/buildroot/commit/?id=a930d9cef6bdcf8de7d086ea66d977530200b8e0
http://git.buildroot.org/buildroot/commit/?id=8f570cd765d52da56b4cebd4e5149ab8ebceec7f

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
