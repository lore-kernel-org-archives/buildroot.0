From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 Nov 2013 12:12:46 +0000 (UTC)
Subject: [Buildroot] [Bug 6668] iptables limit module alignment problem on
	mips64
In-Reply-To: <bug-6668-163@https.bugs.busybox.net/>
References: <bug-6668-163@https.bugs.busybox.net/>
Message-ID: <20131111121246.D34B69BAFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6668

--- Comment #3 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-11 12:12:46 UTC ---
On a second look i was somewhat rude, so sorry about that.

This is a volunteer effort and people labeling problems as critical when they
aren't is sometimes very draining, it's like people going all "me me me" and
wanting to be the center of the universe or something - when in fact it'll
probably get them ignored on a perpetual basis when they do that too much.

Taking that into consideration most of the contributors don't have mips64
boards to test things on and the qemu emulation is mostly broken so only basic
things can be tested (bare shell, can't do much), and only mips64 N32 ABI uses
mixed 64/32-bit kernel/userspace from all the combinations supported at the
moment, so we can't even reproduce this issue.

Again, sorry, and i suggest you take it up with the netfilter dev team at their
bugzilla or their mailing list (probably better).
And please do provide them with details including kernel & iptables version.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
