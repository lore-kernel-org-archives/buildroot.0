From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  7 Jun 2010 10:27:37 +0000 (UTC)
Subject: [Buildroot] [Bug 743] Add Transmission bit torrent option to
	buildroot
In-Reply-To: <bug-743-163@https.bugs.busybox.net/>
References: <bug-743-163@https.bugs.busybox.net/>
Message-ID: <20100607102737.535138B684@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=743

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
There's no need to pass --prefix, DISABLE_NLS and DISABLE_LARGEFILE in
TRANSMISSION_CONF_OPT. Is --localstatedir really necessary (i.e what's the
default value ?).

A minor detail: if a message is printed in a post install hook, a useful
message would probably be better (something like "Installing S92transmission
init script" rather than "Post installing").

Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
