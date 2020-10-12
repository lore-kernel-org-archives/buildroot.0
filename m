From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 12 Oct 2020 09:30:04 +0000
Subject: [Buildroot] [Bug 13251] cryptsetup does not work on branch 2020.02
 following json-c upgrade
In-Reply-To: <bug-13251-163@https.bugs.busybox.net/>
References: <bug-13251-163@https.bugs.busybox.net/>
Message-ID: <bug-13251-163-MfLaX8luEd@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13251

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git, will be part of the upcoming 2020.02.7 release:
https://git.buildroot.org/buildroot/commit/?h=2020.02.x&id=2fe040e7e79170299bcc1fb3d0f6d64cd2823583

-- 
You are receiving this mail because:
You are on the CC list for the bug.
