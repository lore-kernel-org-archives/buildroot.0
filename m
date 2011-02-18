From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 18:31:46 +0000 (UTC)
Subject: [Buildroot] [Bug 3313] mesa3d fails to build
In-Reply-To: <bug-3313-163@https.bugs.busybox.net/>
References: <bug-3313-163@https.bugs.busybox.net/>
Message-ID: <20110218183146.C1BDF8F5E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3313

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Buildroot currently packages version 7.6.1 of mesa3d, but the latest upstream
version seems to be 7.9.1, in
ftp://ftp.freedesktop.org/pub/mesa/7.9.1/MesaLib-7.9.1.tar.bz2. Maybe we should
bump the version in BR first ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
