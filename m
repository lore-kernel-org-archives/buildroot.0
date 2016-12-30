From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 07:35:31 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-3CshFAnC7c@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #10 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to bilge from comment #8)

Compared to nodejs, busybox is tiny - E.G. a busybox build with only the env
applet is ~60K here.

Lots of software expects a minimum of basic UNIX functionality (coreutils
things like ls/cp/mv/cat/env/.. and a shell). We do give you the option in
Buildroot to disable both as there are use cases where it makes sense, but it
really is an advanced case and you are expected to know what you are doing if
you do so and handle any breakage yourself.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
