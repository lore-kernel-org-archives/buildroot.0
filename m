From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 11 Dec 2011 21:53:05 +0000 (UTC)
Subject: [Buildroot] [Bug 4592] libXfont and libXft building failed,
 cross-compilation error
In-Reply-To: <bug-4592-163@https.bugs.busybox.net/>
References: <bug-4592-163@https.bugs.busybox.net/>
Message-ID: <20111211215305.4FA028F8CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4592

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2011-12-11 21:53:05 UTC ---
Sorry, I cannot reproduce it here. Please provide some more details:

- What is your exact .config?
- Do you have freetype development headers/libs on your host?
- libXft uses pkg-config to find freetype, and freetype depends on
host-pkg-config, so that should be fine. Could you please attach your
output/build/xlib_libXft-2.1.14/config.log file?

Thanks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
