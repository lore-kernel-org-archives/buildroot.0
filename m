From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Sep 2014 15:52:07 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit doesn't start with glibc 2.19 because
 geteuid() fails
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140904155207.ACD609D5F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-09-04 15:52:07 UTC ---
> It's the configuration of 2014.08 no changes by me.

Sorry, this does not make sense:
  - there is no default configuration in Buildroot;
  - the default C library is uClibc, not glibc/eglibc.

So, yes, you did some configuration.
Please provide your .config file.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
