From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  2 Apr 2015 21:39:05 +0000 (UTC)
Subject: [Buildroot] [Bug 7981] Target file system skeleton permissions
	hazard
In-Reply-To: <bug-7981-163@https.bugs.busybox.net/>
References: <bug-7981-163@https.bugs.busybox.net/>
Message-ID: <20150402213905.06C1F81778@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7981

--- Comment #2 from Julien Olivain <juju@cotds.org> 2015-04-02 21:39:04 UTC ---
I reviewed and tested successfully the mentioned patches with few defconfigs.
It fixes the target rootfs perms in case of less common umask at clone or
build time (like 0027 or 0077).

Can you please add the Reviewed-by and Tested-by lines?

Reviewed-by: Julien Olivain <juju@cotds.org>
Tested-by: Julien Olivain <juju@cotds.org>

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
