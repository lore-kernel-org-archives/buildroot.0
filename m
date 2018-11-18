From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Nov 2018 18:39:39 +0000
Subject: [Buildroot] [Bug 11086] download/git submodule breaks on symlinked
 dl folder
In-Reply-To: <bug-11086-163@https.bugs.busybox.net/>
References: <bug-11086-163@https.bugs.busybox.net/>
Message-ID: <bug-11086-163-IKst9X15zL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11086

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=632e164a19fc3d1ce419c60eb85214d42a673b28,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
