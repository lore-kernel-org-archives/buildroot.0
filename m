From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Dec 2016 20:50:18 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-wktv3evItt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #14 from bilge at scriptfusion.com ---
Tom, if that is your decision, I can respect it. However, there is still the
outstanding issue that `env` is an unlisted dependency of NPM and even though I
could build it myself (e.g. building Busybox/Coreutils as directed by Peter),
there is no guarantee that it would actually build those dependencies _before_
NPM and may still fail!

-- 
You are receiving this mail because:
You are on the CC list for the bug.
