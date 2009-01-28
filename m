From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 20:05:52 +0000 (UTC)
Subject: [Buildroot] [Bug 79] No version-number for the Freetype-package
In-Reply-To: <bug-79-163@https.bugs.busybox.net/>
References: <bug-79-163@https.bugs.busybox.net/>
Message-ID: <20090128200552.8FA70769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=79





--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  2009-01-28 20:05:52 UTC ---
This normally happens because a package depends on freetype, but forgets to
select it in Kconfig. From a quick look at packages/ it seems like xpdf is one
of those, could it be that you're trying to build xpdf?

If not, please post your entire .config


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
