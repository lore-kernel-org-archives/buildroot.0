From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 11:35:14 +0000 (UTC)
Subject: [Buildroot] [Bug 73] Bump openssl package to the latest version
In-Reply-To: <bug-73-163@https.bugs.busybox.net/>
References: <bug-73-163@https.bugs.busybox.net/>
Message-ID: <20090128113514.6A2A477091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=73





--- Comment #8 from Gustavo Zacarias <gustavo@zacarias.com.ar>  2009-01-28 11:35:12 UTC ---
Created an attachment (id=43)
 --> (https://bugs.busybox.net/attachment.cgi?id=43)
Patch to bump to 0.9.8j

Here's a simplified patch, basically renames the relevant 0.9.8g patches for
0.9.8j, add a no-fips patch (removes newly introduced garbage in the target for
0.9.8j), and moves openssldir from /usr/lib/ssl to /etc/ssl.
I basically ignored the avr32 patch on this take.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
