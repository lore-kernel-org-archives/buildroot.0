From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Dec 2013 16:22:56 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131205162256.5D08D9BED3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #5 from Ryan Barnett <rjbarnet@rockwellcollins.com> 2013-12-05 16:22:55 UTC ---
Are you saying that this could be causing the issue? I don't have time to
figure out if it really does.

All I was doing was playing around with trying to add the ability to specify
multiple BR2_GLOBAL_PATCH_DIR for performing builds and I accidentally ran
across when I was printing out PATCH_BASE_DIRS in the patching step and noticed
that /linux was being printed out. 

Thomas Petazzoni was next to me and told me to submit a bug for it since I
wasn't really intending (more so don't have time) to fix this issue. 

I hope I made it clear that this is in no way an issue for me but rather
something I noticed when doing some development.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
