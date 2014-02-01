From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  1 Feb 2014 11:27:50 +0000 (UTC)
Subject: [Buildroot] [Bug 6818] toolchainfile.cmake has absolut path
	references
In-Reply-To: <bug-6818-163@https.bugs.busybox.net/>
References: <bug-6818-163@https.bugs.busybox.net/>
Message-ID: <20140201112750.EA53F9C727@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6818

--- Comment #2 from u.strempel at googlemail.com 2014-02-01 11:27:50 UTC ---
Created attachment 5192
  --> https://bugs.busybox.net/attachment.cgi?id=5192
Patch for generating toolchainfile.cmake with relative-paths

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
