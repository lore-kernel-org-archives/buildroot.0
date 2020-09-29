From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Sep 2020 18:49:53 +0000
Subject: [Buildroot] [Bug 13216] [Documentation] 2020.02.6 requires GNU find
 utils
In-Reply-To: <bug-13216-163@https.bugs.busybox.net/>
References: <bug-13216-163@https.bugs.busybox.net/>
Message-ID: <bug-13216-163-yRsgNzQITx@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13216

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Thanks for the report, I have added the 2020.02.6 release now, I must have
missed adding it when I made the release.

The -print0 option is used in quite a lot of places (and may be used by the
build system of various packages as well), so I guess the only sensible
solution is to update our documentation.

Out of interest, what find implementation are you using? Even the busybox
applet supports it.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
