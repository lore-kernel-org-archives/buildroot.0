From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Aug 2015 09:09:30 +0000 (UTC)
Subject: [Buildroot] [Bug 8276] package/dropbear: symlink resolution
	incorrect
In-Reply-To: <bug-8276-163@https.bugs.busybox.net/>
References: <bug-8276-163@https.bugs.busybox.net/>
Message-ID: <20150811090930.6F98B81E66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8276

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-08-11 09:09:30 UTC ---
Hello,

I've tried to reproduce the issue, but it just works for me here.
But I've looked, and our default busybox configuration has
CONFIG_FEATURE_READLINK_FOLLOW enabled.

Did you customise your Busybox configuration?

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
