From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  5 Dec 2011 12:22:23 +0000 (UTC)
Subject: [Buildroot] [Bug 4568] [PATCH] Added initscript for avahi-autoipd
In-Reply-To: <bug-4568-163@https.bugs.busybox.net/>
References: <bug-4568-163@https.bugs.busybox.net/>
Message-ID: <20111205122223.3B7178F782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4568

Tilman Baumann <tilman.baumann@grandeye.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #2 from Tilman Baumann <tilman.baumann@grandeye.com> 2011-12-05 12:22:22 UTC ---
(In reply to comment #1)
> avahi-autoipd is normally used as a fallback for dhcp (which is why we install
> the custom udhcpc script). If you want to use it without udhcpc then you indeed
> need to run it manually somehow, using an init script or from
> /etc/network/interfaces, but just unconditionally installing this init script
> for everyone doesn't make much sense.

Thanks. That makes sense.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
