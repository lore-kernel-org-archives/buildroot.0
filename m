From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 23 Sep 2015 21:03:38 +0000 (UTC)
Subject: [Buildroot] [Bug 8366] libevent does not build
In-Reply-To: <bug-8366-163@https.bugs.busybox.net/>
References: <bug-8366-163@https.bugs.busybox.net/>
Message-ID: <20150923210338.6ECB581D65@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8366

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-09-23 21:03:38 UTC ---
Thanks! We are anyway working on an improvement to Buildroot that will verify
that this Perl module is installed, and if not, Buildroot will error out
earlier and with a clearer error message.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
