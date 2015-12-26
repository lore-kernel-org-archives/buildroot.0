From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Dec 2015 21:46:06 +0000
Subject: [Buildroot] [Bug 7886] gettext: link failure with locally-installed
	libxml2
In-Reply-To: <bug-7886-163@https.bugs.busybox.net/>
References: <bug-7886-163@https.bugs.busybox.net/>
Message-ID: <bug-7886-163-P6qc8SKfJx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7886

--- Comment #3 from Yann E. MORIN <yann.morin.1998@free.fr> ---
I've sent an updated version of the proposed fix, and have updated
the commit log with extra information on the reason why we want
host-gettext to depend on host-libxml2:
    https://patchwork.ozlabs.org/patch/561119/

-- 
You are receiving this mail because:
You are on the CC list for the bug.
