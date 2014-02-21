From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 21 Feb 2014 17:40:24 +0000 (UTC)
Subject: [Buildroot] [Bug 4706] Removing .stamp_target_installed does not
 trigger reinstall libraries
In-Reply-To: <bug-4706-163@https.bugs.busybox.net/>
References: <bug-4706-163@https.bugs.busybox.net/>
Message-ID: <20140221174024.7B90D9CB0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4706

--- Comment #3 from J?r?me Pouiller <jezz@sysmic.org> 2014-02-21 17:40:23 UTC ---
I think this bug should be marked as FIXED instead of WONTFIX.
build/toolchain-external-undefined/.stamp_target_installed is now used instead
of stamps/ext-toolchain-installed. As far as I understand, it is behavior asked
by submitter.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
