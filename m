From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Dec 2013 16:28:57 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131205162859.0642E9BEE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-12-05 16:28:57 UTC ---
Ryan, can you confirm to Thomas DS which Buildroot version you were using? I
believe you were using the latest master, i.e a Buildroot version that does
include the
http://git.buildroot.net/buildroot/commit/?id=9e7e9b215017ee91c9369f01476bb4b4fc5f2484
commit that Thomas DS pointed out.

So I believe the issue that Ryan is reporting still exists in the current
Buildroot master.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
