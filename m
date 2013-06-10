From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 Jun 2013 03:46:40 +0000 (UTC)
Subject: [Buildroot] [Bug 6302] Versions of packages retrieved from
	github.com are wrong
In-Reply-To: <bug-6302-163@https.bugs.busybox.net/>
References: <bug-6302-163@https.bugs.busybox.net/>
Message-ID: <20130610034640.C51709A59F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6302

--- Comment #5 from Andrew Scheller <uclibc-bugzilla@loowis.durge.org> 2013-06-10 03:44:56 UTC ---
Fixing this bug also involved commit ids:
41190ef0f1ffb68675bfe77205e9207363546377  (linenoise)
0b8ed5b53d066f86f09e01d02a5e0bd715c17b70  (lua-msgpack-native)
because they were using invalid git hashes (which this bug had been masking).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
