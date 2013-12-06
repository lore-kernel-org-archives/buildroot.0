From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  6 Dec 2013 11:26:33 +0000 (UTC)
Subject: [Buildroot] [Bug 6722] Usage of $($(PKG)_DIR_PREFIX) is an issue
 with linux package
In-Reply-To: <bug-6722-163@https.bugs.busybox.net/>
References: <bug-6722-163@https.bugs.busybox.net/>
Message-ID: <20131206112633.A813E9BF46@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6722

--- Comment #7 from Ryan Barnett <rjbarnet@rockwellcollins.com> 2013-12-06 11:26:32 UTC ---
As I stated in the original message of this bug report - I was using commit
931b73e5eae4a3ba6b2e37db526fd7243a139e64 as my head which is from 29 Nov 2013.
This means that the patch that Thomas D mention above was included in my
testing. Thus I believe that this is still an issue even with the patch Thomas
D mentioned.

The tree that I was using was this -
http://git.buildroot.net/buildroot/tree/?id=931b73e5eae4a3ba6b2e37db526fd7243a139e64.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
