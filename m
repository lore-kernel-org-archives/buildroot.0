From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 May 2009 17:10:50 +0000 (UTC)
Subject: [Buildroot] [Bug 345] libcurl package needs a urandom fix
In-Reply-To: <bug-345-163@https.bugs.busybox.net/>
References: <bug-345-163@https.bugs.busybox.net/>
Message-ID: <20090526171051.2286776490@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=345





--- Comment #4 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-05-26 17:10:49 UTC ---
Created an attachment (id=355)
 --> (https://bugs.busybox.net/attachment.cgi?id=355)
My buildroot .config

Actually openssl IS installed, just not in the .config
It seems it's being pulled in by something else in a bad way, probably
x11r7-related.
Any (easy) way to trace this?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
