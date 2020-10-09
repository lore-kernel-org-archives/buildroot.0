From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 09 Oct 2020 16:37:34 +0000
Subject: [Buildroot] [Bug 13241] CMake miss linking with pthread library
In-Reply-To: <bug-13241-163@https.bugs.busybox.net/>
References: <bug-13241-163@https.bugs.busybox.net/>
Message-ID: <bug-13241-163-grJ6eQKcj2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13241

--- Comment #4 from Leonid Yuriev <leo@yuriev.ru> ---
(In reply to Fabrice Fontaine from comment #3)

Minor clarification:

- v4 of the my package-submission patch already includes a workaround for this
bug. So it is expected to build it with CMake >= 3.8 successfully with
buildroot or on a host.

- To reproduce the problem, remove the corresponding patch from the libmdbx
package, or use the patch attached (#8601) above without workaround.

- v4 passes review and libmdbx' mainstream already contain a workaround for
this bug. So I don't suppose to ship v5 until the next release of libmdbx or
until some bug affecting buildroot users or builds was fixed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
