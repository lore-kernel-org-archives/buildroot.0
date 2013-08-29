From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Aug 2013 07:32:34 +0000 (UTC)
Subject: [Buildroot] [Bug 3397] New Package: cryptsetup
In-Reply-To: <bug-3397-163@https.bugs.busybox.net/>
References: <bug-3397-163@https.bugs.busybox.net/>
Message-ID: <20130829073234.0B0F79B5DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3397

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-08-29 07:32:57 UTC ---
A cryptsetup package has been committed as of
http://git.buildroot.net/buildroot/commit/?h=next&id=21028166a5a9d09063eec916e4ad60c964cff27d.
At the time of this writing, this commit is part of the 'next' branch, which
will be merged into the 'master' branch after the 2013.08 release is done.

If you want to use it today, test the 'next' branch, or wait a few more days
for the 2013.08 release to happen, at which point you'll find the package in
the normal 'master' branch. If you only use stable releases of Buildroot,
you'll have to wait until the 2013.11 release, which will incorporate this new
package.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
