From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  8 Jul 2014 20:20:50 +0000 (UTC)
Subject: [Buildroot] [Bug 7268] python 2.7 compilation issue on a
 Debian/Ubuntu host with multiarch support
In-Reply-To: <bug-7268-163@https.bugs.busybox.net/>
References: <bug-7268-163@https.bugs.busybox.net/>
Message-ID: <20140708202050.CB25F9D1CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7268

--- Comment #13 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-07-08 20:20:50 UTC ---
Patch for python posted at http://patchwork.ozlabs.org/patch/368000/, and patch
for python3 posted at http://patchwork.ozlabs.org/patch/368001/.

Thanks a lot David for your bug report and investigation! Once the patches are
merged by Peter, we'll mark this bug as fixed. Of course, it would be good if
you could formally test the patches, and give your Tested-by on the patches if
their work for you.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
