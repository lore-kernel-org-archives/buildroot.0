From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  5 Sep 2014 10:27:13 +0000 (UTC)
Subject: [Buildroot] [Bug 7364] monit builds a static application,
 even though BR2_PREFER_STATIC_LIB is not set, and with glibc.
In-Reply-To: <bug-7364-163@https.bugs.busybox.net/>
References: <bug-7364-163@https.bugs.busybox.net/>
Message-ID: <20140905102713.1F4FD9D604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7364

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|monit doesn't start with    |monit builds a static
                   |glibc 2.19 because          |application, even though
                   |geteuid() fails             |BR2_PREFER_STATIC_LIB is
                   |                            |not set, and with glibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
