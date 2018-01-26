From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Jan 2018 14:15:56 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-UUqeRbqmtw@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #7 from Mark Hirota <mhirota@impinj.com> ---
Arnout: I believe the issue is with ccache 3.3.4.  I see in the 3.3.5 release
notes (https://ccache.samba.org/releasenotes.html#_ccache_3_3_5) the following:

> Fixed a bug related to erroneously storing a dependency file with absolute paths in the cache on a preprocessed hit.

Should the ccache version in buildroot be updated to 3.3.5?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
