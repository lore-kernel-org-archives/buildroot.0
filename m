From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Apr 2010 06:14:58 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100429061458.275EE24C26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651





--- Comment #2 from Mitch Davis <mjd-busybox.net@afork.com>  2010-04-29 06:14:57 UTC ---
The ccache setting was not changed, so it has the default value of unset.

mjd at milhouse ~/src/buildroot $ grep CCACHE .config
# BR2_CCACHE is not set
# BR2_PACKAGE_CCACHE_TARGET is not set
mjd at milhouse ~/src/buildroot $ 


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
