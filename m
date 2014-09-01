From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  1 Sep 2014 10:20:56 +0000 (UTC)
Subject: [Buildroot] [Bug 7346] [2014.08rc3] vim-8ae50e3ef8bf.tar.gz can not
 be downloaded, 404 not found
In-Reply-To: <bug-7346-163@https.bugs.busybox.net/>
References: <bug-7346-163@https.bugs.busybox.net/>
Message-ID: <20140901102056.12AC49D561@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7346

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-09-01 10:20:55 UTC ---
This is not a problem with Buildroot.
First of all, two downloads are attempted: one from the vim mercurial
repository directly, and since it fails, a fallback to sources.buildroot.net.

The latter does not contain the vim package, but this is only a fallback.

The real problem is that in your run, the vim server did not respond. This may
be a temporary issue with the vim server (googlecode), or a connection problem
due to proxy issues.

I have just tested, and the download works fine here.
Have you tried this again at another time?

Have you checked your proxy correctly?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
