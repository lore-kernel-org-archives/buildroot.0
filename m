From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 21:21:42 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150604212142.8558F81E32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-06-04 21:21:42 UTC ---
Thomas, All,

So, we have a bunch of pkg-kconfig issues introduced with the pkg-kconfig
infra itself, but also further bugs hiding those first ones, later bugs
introduced with the support for kconfig fragments.

For a starter, merge-config.sh does not bail out if the input file(s) do
not exist. Once that is fixed, your problem indeed re-appears. And I'm
afraid there's more going on behind the scene... :-(

I'm working on that, but that's far from trivial... :-(

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
