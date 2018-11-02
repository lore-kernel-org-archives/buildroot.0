From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 09:31:13 +0000
Subject: [Buildroot] [Bug 11326] sysvinit fails to build in latest GIT master
In-Reply-To: <bug-11326-163@https.bugs.busybox.net/>
References: <bug-11326-163@https.bugs.busybox.net/>
Message-ID: <bug-11326-163-n6CGV5g4gA@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11326

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
This is fixed since the bump to sysvinit 2.90 in commit
https://git.buildroot.org/buildroot/commit/package/sysvinit?id=37bd607160564296d70648eafdad0dbc593a8a95.
Thanks!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
