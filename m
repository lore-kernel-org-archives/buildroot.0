From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 10 May 2010 21:48:28 +0000 (UTC)
Subject: [Buildroot] [Bug 1741] external toolchain linking error
In-Reply-To: <bug-1741-163@https.bugs.busybox.net/>
References: <bug-1741-163@https.bugs.busybox.net/>
Message-ID: <20100510214828.A4AE48DC89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1741

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, I also have this problem with a Crosstool-NG eglibc toolchain while trying
to compile netsnmp. It's due to the fact that libtool removes the --sysroot
argument.

With which package and configuration do you have this failure ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
