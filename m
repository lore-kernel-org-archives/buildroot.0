From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 09:12:45 +0000 (UTC)
Subject: [Buildroot] [Bug 2137] Support rc versions of kernel headers
In-Reply-To: <bug-2137-163@https.bugs.busybox.net/>
References: <bug-2137-163@https.bugs.busybox.net/>
Message-ID: <20130526091245.392239A331@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2137

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 09:11:35 UTC ---
Will, are you still interested by this? You never attached any patch to this
bug. Since the bug is three years old and I know you've been active in
Buildroot since that time, I suppose you're no longer that much interested in
this feature, so I'm marking this as "won't fix". However, if you're interested
in reviving this, do not hesitate to send a patch (I believe if we need such a
feature, we should simply allow to specify a custom tarball location of kernel
sources for the kernel headers).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
