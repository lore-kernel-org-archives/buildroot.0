From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Jul 2009 16:25:56 +0000 (UTC)
Subject: [Buildroot] [Bug 473] memstat_0.5.tar.gz has install with -D and
 that fails "make" (last buildroot git)
In-Reply-To: <bug-473-163@https.bugs.busybox.net/>
References: <bug-473-163@https.bugs.busybox.net/>
Message-ID: <20090720162556.CEF1E77812@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473





--- Comment #2 from Etienne Lorrain <etienne_lorrain@yahoo.fr>  2009-07-20 16:25:55 UTC ---
Created an attachment (id=485)
 --> (https://bugs.busybox.net/attachment.cgi?id=485)
main config file

 I attach my .comfig, but the problem seems more like that directory:
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
 should exist before trying to install.
 Isn't that the target device /etc ? (just begining with buildroot...)


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
