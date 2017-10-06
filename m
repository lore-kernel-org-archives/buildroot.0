From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Oct 2017 12:45:38 +0000
Subject: [Buildroot] [Bug 10366] dropbear download url has changed
In-Reply-To: <bug-10366-163@https.bugs.busybox.net/>
References: <bug-10366-163@https.bugs.busybox.net/>
Message-ID: <bug-10366-163-2gRajaM6oK@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10366

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to adyke from comment #5)

Ok. Can you post the exact error message you get from wget (and your wget
version)?

For downloads done by Buildroot it should automatically fall back to
sources.buildroot.org when upstream isn't accessible. Isn't that working for
you?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
