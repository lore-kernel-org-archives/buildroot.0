From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 11:24:32 +0000 (UTC)
Subject: [Buildroot] [Bug 5978] Erlang does not build for arm in 2013.02-rc3
In-Reply-To: <bug-5978-163@https.bugs.busybox.net/>
References: <bug-5978-163@https.bugs.busybox.net/>
Message-ID: <20130526112432.7FA6F9A2C6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5978

--- Comment #5 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 11:23:23 UTC ---
I've just tested building erlang for ARM with the latest Buildroot, and it
builds fine here. I've tested both a dynamic library build and a static library
build, and both went fine.

Could you post the Buildroot .config that exhibits the problem? Also, do you
have zlib installed on your host machine? And its development files?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
