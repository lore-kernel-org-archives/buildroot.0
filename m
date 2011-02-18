From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 20:59:39 +0000 (UTC)
Subject: [Buildroot] [Bug 3313] mesa3d fails to build
In-Reply-To: <bug-3313-163@https.bugs.busybox.net/>
References: <bug-3313-163@https.bugs.busybox.net/>
Message-ID: <20110218205939.63A328F5DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3313

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
(In reply to comment #2)
> Buildroot currently packages version 7.6.1 of mesa3d, but the latest upstream
> version seems to be 7.9.1, in
> ftp://ftp.freedesktop.org/pub/mesa/7.9.1/MesaLib-7.9.1.tar.bz2. Maybe we should
> bump the version in BR first ?

Possibly, but we have to be careful about the dependencies. I'm not interested
in moving the entire X stack forward this close to the release.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
