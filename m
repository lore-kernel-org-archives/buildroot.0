From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Mar 2017 23:12:02 +0000
Subject: [Buildroot] [Bug 9706] Can't download newer revisions of package
	from PyPI
In-Reply-To: <bug-9706-163@https.bugs.busybox.net/>
References: <bug-9706-163@https.bugs.busybox.net/>
Message-ID: <bug-9706-163-Xd8rm5tJIK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9706

--- Comment #3 from J. Eric Mason <jem@kamama.com> ---
Semantically buildroot could (I won't go as far to say should yet) be using the
simple repository protocol to find download URLs and hashes for a package
generically https://www.python.org/dev/peps/pep-0503/ as the URLs could change
over time. If I have the bandwidth I'll see if I can propose a changelist to do
this resolution so this wouldn't be a problem in the future.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
