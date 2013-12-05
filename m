From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  5 Dec 2013 08:46:09 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131205084609.74F349BF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #3 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2013-12-05 08:46:09 UTC ---
See 
http://patchwork.ozlabs.org/patch/290253/
http://patchwork.ozlabs.org/patch/290254/

As said, there needs to be some changes on the second patch (see the discussion
there, I thought it was mainly the naming of the DIR_PREFIX variable).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
