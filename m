From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 05 Sep 2019 10:16:09 +0000
Subject: [Buildroot] [Bug 12181] dropbear: norootlogin (-w) no longer works
 when PAM is enabled
In-Reply-To: <bug-12181-163@https.bugs.busybox.net/>
References: <bug-12181-163@https.bugs.busybox.net/>
Message-ID: <bug-12181-163-i4LpnEkoUU@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12181

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |FIXED
             Status|ASSIGNED                    |RESOLVED

--- Comment #4 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed by
https://git.buildroot.org/buildroot/commit/?id=ae81527917e74b9751df4e7bfb7a0b2688362eac,
thanks

-- 
You are receiving this mail because:
You are on the CC list for the bug.
