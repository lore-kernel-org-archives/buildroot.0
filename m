From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Sep 2015 09:30:55 +0000 (UTC)
Subject: [Buildroot] [Bug 4099] cut utility from GNU coreutils works
	incorrect
In-Reply-To: <bug-4099-163@https.bugs.busybox.net/>
References: <bug-4099-163@https.bugs.busybox.net/>
Message-ID: <20150921093055.BF4C781922@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4099

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-09-21 09:30:55 UTC ---
Fixed by commits 26ae113d1186951c4969000f5de2ec67e7f1ba3e and
e07cc92491080289188b3618d687b06bb9aa6041. Thanks Waldemar!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
