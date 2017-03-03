From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Mar 2017 17:31:53 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-MHT1S4y0SQ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #24 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Arnout Vandecappelle from comment #23)

I'll do the change, for sanity sake.

However:
  - the checkwinsize option is disabled by default in a non interactive shell,
  - this is not interactive shell, so SIGWINCH should be ignored.

I'll paste a patch in a moment...

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
