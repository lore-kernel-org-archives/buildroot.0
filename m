From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jul 2010 14:07:13 +0000 (UTC)
Subject: [Buildroot] [Bug 575] webkit: Buildroot Libtool Patch Fails
In-Reply-To: <bug-575-163@https.bugs.busybox.net/>
References: <bug-575-163@https.bugs.busybox.net/>
Message-ID: <20100728140713.9C7CB83667@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=575

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
All issues mentionned in this bug have been fixed :

 * The libtool patch is no longer applied to webkit

 * The dependency from webkit to Cairo PNG has been added

 * The patch to fix the Webkit build failure due to missing pthread calls in
uClibc has been added

I'm therefore closing this bug.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
