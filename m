From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 22:04:55 +0000 (UTC)
Subject: [Buildroot] [Bug 1711] Should libtool package install ltmain.sh
	into staging ?
In-Reply-To: <bug-1711-163@https.bugs.busybox.net/>
References: <bug-1711-163@https.bugs.busybox.net/>
Message-ID: <20100607220455.D79907FBC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=1711

Nick Leverton <nick@leverton.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nick at leverton.org

--- Comment #2 from Nick Leverton <nick@leverton.org>  ---
Heavens no, I'm not sure why it looks like I said that.  Sorry.  So many
packages in buildroot rely on that file.  Did my patch have a bad side effect
on it ?

I'm wondering if there is any reason why the latest ltmain.sh shouldn't be
available in the toolchain staging as-is, rather than going to the trouble of
patching $RANDOM_LTMAIN from the upstream ?  On my Debian packaging I find it's
often (not always, admittedly) more trouble than it's worth to patch auto*/lt*
rather than just use the distro's current version (BR's current build version
chosen by the configurer, in this case).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
