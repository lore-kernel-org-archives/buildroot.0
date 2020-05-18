From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 May 2020 17:38:02 +0000
Subject: [Buildroot] [Bug 12876] putilimp.h **error**: missing binary
 operator before token "(" #elif __has_builtin(__c11_atomic_load) && \
In-Reply-To: <bug-12876-163@https.bugs.busybox.net/>
References: <bug-12876-163@https.bugs.busybox.net/>
Message-ID: <bug-12876-163-5xt4ZfOmpt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12876

--- Comment #3 from Markus Zehnder <zehnder@live.com> ---
(In reply to Fabrice Fontaine from comment #1)
Thanks Fabrice!
I had the exact same issue with Buildroot 2020.02.2 and the linked patch solved
it.
Please include it in the next release.

Best regards,
Markus

-- 
You are receiving this mail because:
You are on the CC list for the bug.
