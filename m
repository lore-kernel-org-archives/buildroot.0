From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 22 Sep 2011 18:44:49 +0000 (UTC)
Subject: [Buildroot] [Bug 4219] can't complie microperl with error undefined
 reference to `__ctype_b'
In-Reply-To: <bug-4219-163@https.bugs.busybox.net/>
References: <bug-4219-163@https.bugs.busybox.net/>
Message-ID: <20110922184449.D1BB08D9F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4219

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
I guess your uClibc lacks UCLIBC_HAS_CTYPE_TABLES, which is enabled in the
default uClibc configuration that Buildroot uses to build a toolchain. Can you
check your uClibc configuration ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
