From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 18 Feb 2012 11:50:41 +0000 (UTC)
Subject: [Buildroot] [Bug 4772] Add uClibc configuration file option to
 crosstool-ng toolchain support
In-Reply-To: <bug-4772-163@https.bugs.busybox.net/>
References: <bug-4772-163@https.bugs.busybox.net/>
Message-ID: <20120218115041.4730190AEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4772

--- Comment #1 from s.martin49 at gmail.com 2012-02-18 11:50:41 UTC ---
(In reply to comment #0)
> Currently when selecting a crosstool-ng-uClibc toolchain you cannot specify the
> uClibc config file as it is always written over by the default. This patch adds
> an option to the menuconfig to specify an alternative.

Actually, when selecting a crosstool-NG toolchain in 'make menuconfig', you can
then run 'make ctng-menuconfig' to customize it, and specify an uclibc
config-file for uClibc toolchains.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
