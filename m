From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 Jan 2017 11:03:29 +0000
Subject: [Buildroot] [Bug 9541] Platform drivers autoloading from info in
 device tree does not work
In-Reply-To: <bug-9541-163@https.bugs.busybox.net/>
References: <bug-9541-163@https.bugs.busybox.net/>
Message-ID: <bug-9541-163-L1W63CZ2kK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9541

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |WORKSFORME
             Status|ASSIGNED                    |RESOLVED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
Great, I'll close the issue then. Perhaps it makes sense to enable mdev for the
rpi*_defconfigs to make it easier to use?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
