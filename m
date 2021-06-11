From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Jun 2021 11:50:29 +0000
Subject: [Buildroot] [Bug 13831] mesa3d - kmsro driver requires dri3
In-Reply-To: <bug-13831-163@https.bugs.busybox.net/>
References: <bug-13831-163@https.bugs.busybox.net/>
Message-ID: <bug-13831-163-lF4Epsxth1@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13831

Erico Nunes <nunes.erico@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nunes.erico at gmail.com,
                   |                            |ps.report at gmx.net

--- Comment #1 from Erico Nunes <nunes.erico@gmail.com> ---
FYI we added a check in the mesa meson configuration to prevent this:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11305

And there might be more changes in
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/11318 proposing to
remove the option to manually disable dri3 at all.

I see that Peter Seiderer had some pending patches related to this in the list
so adding him in Cc here.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
