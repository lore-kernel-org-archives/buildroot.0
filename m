From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Mar 2018 10:30:09 +0000
Subject: [Buildroot] [Bug 10776] ktap fails to build
In-Reply-To: <bug-10776-163@https.bugs.busybox.net/>
References: <bug-10776-163@https.bugs.busybox.net/>
Message-ID: <bug-10776-163-WdBv6iiK4Q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10776

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
Upstream ktap git has fixes for building against newer kernel versions (up to
4.8), so it makes more sense to bump the version. I've sent a patch doing that:

https://patchwork.ozlabs.org/patch/893750/

Notice that ktap upstream seems pretty dead, so consider using another tracing
tool.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
