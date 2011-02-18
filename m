From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 18 Feb 2011 07:50:51 +0000 (UTC)
Subject: [Buildroot] [Bug 3301] mpd fails to build on x86 due to missing
	__tls_get_addr
In-Reply-To: <bug-3301-163@https.bugs.busybox.net/>
References: <bug-3301-163@https.bugs.busybox.net/>
Message-ID: <20110218075051.577438F5BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3301

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, this is not Buildroot's fault: it seems I'm using a Crosstool-NG toolchain
without TLS support.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
