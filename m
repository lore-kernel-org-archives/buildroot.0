From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2015 15:58:16 +0000 (UTC)
Subject: [Buildroot] [Bug 8121] php opcache extension doesn't get installed
In-Reply-To: <bug-8121-163@https.bugs.busybox.net/>
References: <bug-8121-163@https.bugs.busybox.net/>
Message-ID: <20150517155816.E941D80E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8121

--- Comment #1 from pud at nerdpunx.net 2015-05-17 15:58:16 UTC ---
a little more explaination: opcache is the only extension (i know of) that gets
installed to /usr/lib/php, rather than being linked into the binary, so
removing that directory also removes the extension

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
