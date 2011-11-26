From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 26 Nov 2011 20:49:40 +0000 (UTC)
Subject: [Buildroot] [Bug 4514] Booting OS,
 that requires automount of devtmpfs fails if fs image used as
 initramfs
In-Reply-To: <bug-4514-163@https.bugs.busybox.net/>
References: <bug-4514-163@https.bugs.busybox.net/>
Message-ID: <20111126204941.0453F8F600@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4514

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WORKSFORME

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2011-11-26 20:49:40 UTC ---
What buildroot version are you using? We have a pre-init wrapper script in
buildroot since July which does exactly this.

Please update to 2011.11(-rc2).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
