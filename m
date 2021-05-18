From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 May 2021 06:17:48 +0000
Subject: [Buildroot] [Bug 13806] Building host-localedef fails on fedora
 34/gcc 11
In-Reply-To: <bug-13806-163@https.bugs.busybox.net/>
References: <bug-13806-163@https.bugs.busybox.net/>
Message-ID: <bug-13806-163-qGgntrthPE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13806

--- Comment #9 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
To test the patch in the environment in which it was discovered, I applied the
patch to my existing source tree, which contains a sub-module that is the clone
of the buildroot repo checked out to the 2021.02.2 tag.  With the patch applied
the build completed successfully.  Thanks for you patience and help.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
