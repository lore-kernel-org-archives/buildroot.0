From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Nov 2013 23:36:03 +0000 (UTC)
Subject: [Buildroot] [Bug 6626] procps Unknown HZ value! (XX) Assume 100.
In-Reply-To: <bug-6626-163@https.bugs.busybox.net/>
References: <bug-6626-163@https.bugs.busybox.net/>
Message-ID: <20131113233603.03D869BC8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6626

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-13 23:36:02 UTC ---
Instead, we should switch the procps package to use procps-ng, at
http://sourceforge.net/projects/procps-ng/. This one has an active upstream,
with a Git repository and so on.

Cassiano, would you be willing to provide a patch to Buildroot that does this?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
