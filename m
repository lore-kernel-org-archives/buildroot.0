From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 Feb 2017 21:50:31 +0000
Subject: [Buildroot] [Bug 9616] CMake host packages cannot provide CONF_ENV
In-Reply-To: <bug-9616-163@https.bugs.busybox.net/>
References: <bug-9616-163@https.bugs.busybox.net/>
Message-ID: <bug-9616-163-zaLTIU58uF@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9616

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |FIXED

--- Comment #2 from Peter Korsgaard <jacmet@uclibc.org> ---
Fixed in git by Thomas, thanks:

https://git.buildroot.org/buildroot/commit/?id=fc4250119582043bf57a6296ae0264aa95f97fac

Notice that the description is backwards, this in fact is adding it for host
packages.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
