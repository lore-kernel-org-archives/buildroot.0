From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  7 Jul 2015 15:43:01 +0000 (UTC)
Subject: [Buildroot] [Bug 8206] mplayer uses host xorg development files
In-Reply-To: <bug-8206-163@https.bugs.busybox.net/>
References: <bug-8206-163@https.bugs.busybox.net/>
Message-ID: <20150707154301.C9535818F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8206

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-07-07 15:43:01 UTC ---
What exact errors is "mplayer" giving you?

Can you attach the part of the build log related to mplayer (i.e all parts that
are surrounded by ">>> mplayer ..." lines) ?

Buildroot tries as much as possible to not be influenced by things available on
the host machine. However, since the builds are not done inside a chroot, we
cannot guarantee 100% that things installed on your host machine will not
influence the build in a subtle way.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
