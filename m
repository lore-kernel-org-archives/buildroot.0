From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 30 Apr 2010 10:06:37 +0000 (UTC)
Subject: [Buildroot] [Bug 1651] Build fail caused by ccache in
	module-init-tools
In-Reply-To: <bug-1651-163@https.bugs.busybox.net/>
References: <bug-1651-163@https.bugs.busybox.net/>
Message-ID: <20100430100637.C56EF7F8BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1651





--- Comment #5 from Mitch Davis <mjd-busybox.net@afork.com>  2010-04-30 10:06:37 UTC ---
Or looking a little higher up the cause-of-failure tree, why is
module-init-tools being compiled with ccache (when it's turned off in the
config)?


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
