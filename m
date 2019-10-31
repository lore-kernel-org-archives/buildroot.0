From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Oct 2019 22:07:36 +0000
Subject: [Buildroot] [Bug 11411] check-uniq-files target issue
In-Reply-To: <bug-11411-163@https.bugs.busybox.net/>
References: <bug-11411-163@https.bugs.busybox.net/>
Message-ID: <bug-11411-163-HEy07gNSyn@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11411

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #8 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Jean-pierre Cartal from comment #7)

We have instead removed the check-uniq-files logic:

https://git.buildroot.org/buildroot/commit/?id=2496189a4207173e4cd5bbab90256f911175ee57

-- 
You are receiving this mail because:
You are on the CC list for the bug.
