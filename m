From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 23 Sep 2011 08:10:39 +0000 (UTC)
Subject: [Buildroot] [Bug 4231] libneon.so: undefined reference to
	`SSL_SESSION_cmp'
In-Reply-To: <bug-4231-163@https.bugs.busybox.net/>
References: <bug-4231-163@https.bugs.busybox.net/>
Message-ID: <20110923081039.E62C38D4C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4231

--- Comment #1 from marco <marco_cantu_ranzani@libero.it>  ---
SOLUTION:

in

/root/buildroot/buildroot_e_v11.08/output/build/neon-0.28.3/config.h

ADD LINE

/* Define to 1 if you have the `SSL_SESSION_cmp' function. */
#define HAVE_SSL_SESSION_CMP 1

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
