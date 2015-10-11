From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Oct 2015 07:35:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8391] Node.js 0.12.7 fails to build on
	raspberry_pi defconfig
In-Reply-To: <bug-8391-163@https.bugs.busybox.net/>
References: <bug-8391-163@https.bugs.busybox.net/>
Message-ID: <20151011073550.5AFB580054@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8391

--- Comment #3 from Peter Seiderer <ps.report@gmx.net> 2015-10-11 07:35:49 UTC ---
Hello Tom,

I think it is the difference between workaround and fix ;-)

Should be fixed by [1], but a patch supporting nodejs 4.1.2
for buildroot would be welcome...

Regards,
Peter


[1] https://patchwork.ozlabs.org/patch/528714/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
