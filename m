From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 18 Nov 2010 21:11:38 +0000 (UTC)
Subject: [Buildroot] [Bug 759] Sysstat build broken without libintl
In-Reply-To: <bug-759-163@https.bugs.busybox.net/>
References: <bug-759-163@https.bugs.busybox.net/>
Message-ID: <20101118211138.9F08E8A46F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=759

--- Comment #13 from S?rgio <sergio@sergiomb.no-ip.org>  ---
(In reply to comment #12)
> Try changing...
> SYSSTAT_CONF_OPT = --disable-man-group
> to
> SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
> and rebuild, does it work now?

--disable-sensors (In reply to comment #12)
> Try changing...
> SYSSTAT_CONF_OPT = --disable-man-group
> to
> SYSSTAT_CONF_OPT = --disable-man-group --disable-sensors
> and rebuild, does it work now?

yes it worked thanks

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
