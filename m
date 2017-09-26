From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 26 Sep 2017 07:06:34 +0000
Subject: [Buildroot] [Bug 10326] mesa3d package fails to build when
 BR2_SHARED_STATIC_LIBS=y
In-Reply-To: <bug-10326-163@https.bugs.busybox.net/>
References: <bug-10326-163@https.bugs.busybox.net/>
Message-ID: <bug-10326-163-NMMFZHVwoJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10326

--- Comment #2 from Frederic MATHIEU <frederic.mathieu@dualis.com> ---
This patch no longer allows you to compile the package if the configuration
uses BR2_SHARED_STATIC_LIBS (static and shared). Some static libraries are
wished for others packages.

this is not the solution to use.

Regards
Frederic MATHIEU

-- 
You are receiving this mail because:
You are on the CC list for the bug.
