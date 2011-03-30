From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Mar 2011 15:06:46 +0000 (UTC)
Subject: [Buildroot] [Bug 3529] alsa-lib 1.0.24.1 build fails with daily
 snapshot (2011-03-29)
In-Reply-To: <bug-3529-163@https.bugs.busybox.net/>
References: <bug-3529-163@https.bugs.busybox.net/>
Message-ID: <20110330150646.C746781D2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3529

--- Comment #2 from Michael J. Hammel <mjhammel@graphics-muse.org>  ---
I'm using gcc 4.4.5 in this test.  I was using gcc 4.4.1 with Crosstool-NG
1.8.2 but that had a different problem that I posted about on the mailing list.
 Since I wasn't up to latest revs of either Buildroot or Crosstool-NG I decided
to try that first and ran into this.

Anyway, if you'd like me to try with an earlier version of gcc I can.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
