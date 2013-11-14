From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 00:02:30 +0000 (UTC)
Subject: [Buildroot] [Bug 6590] directfb-examples build failed whit linaro
	toolchain
In-Reply-To: <bug-6590-163@https.bugs.busybox.net/>
References: <bug-6590-163@https.bugs.busybox.net/>
Message-ID: <20131114000231.017529BC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6590

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-11-14 00:02:30 UTC ---
You're right, the support for Linaro toolchains was broken in 2013.08.1. This
problem has been fixed in 2013.11-rc1, by the commits:

11ec38b6950cf3337b52fb97f27c2fd7c776c5c2 toolchain-external: fix Linaro ARM
toolchain support
b3e3d5fc28b26291d48adad96e92e27c86183673 toolchain-external: add missing
symlink for Linaro toolchains

Can you retry with 2013.11-rc1 ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
