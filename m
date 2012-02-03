From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  3 Feb 2012 16:19:41 +0000 (UTC)
Subject: [Buildroot] [Bug 2299] Add crypto support to libsoup
In-Reply-To: <bug-2299-163@https.bugs.busybox.net/>
References: <bug-2299-163@https.bugs.busybox.net/>
Message-ID: <20120203161941.A0911909B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2299

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-02-03 16:19:41 UTC ---
This has been fixed by:

commit bd387486ad871164e4fbe86eb6570775086acfbe
Author: Sven Neumann <s.neumann@raumfeld.com>
Date:   Thu Aug 11 11:57:41 2011 +0200

    libsoup: add option to enable HTTPS (SSL) support

    By selecting BR2_PACKAGE_LIBSOUP_SSL the gnutls package is selected
    and libsoup will be compiled with SSL support.

    [Peter: pass --with-libgcrypt-prefix so configure finds it]
    Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
    Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
