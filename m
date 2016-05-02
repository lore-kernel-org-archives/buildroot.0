From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 02 May 2016 19:13:53 +0000
Subject: [Buildroot] [Bug 8901] gcc failes to build if fortran is enabled
In-Reply-To: <bug-8901-163@https.bugs.busybox.net/>
References: <bug-8901-163@https.bugs.busybox.net/>
Message-ID: <bug-8901-163-d8WYEgp0zp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8901

--- Comment #1 from Samuel Martin <s.martin49@gmail.com> ---
(In reply to Thijs Vermeir from comment #0)

AFAICS, this defconfig will try to build a fortran, so libquadmath, without
wchar support, which is required by quadmath...

Care to test with these patches:
https://github.com/tSed/buildroot/commit/ae69ebb61cb14455b282c34b26da97e6d2d4a49d
https://github.com/tSed/buildroot/commit/82b0c580ce934c969839ce5e5029700d9bbdaff6

They are part of a longer series not posted yet.

Regards,

-- 
You are receiving this mail because:
You are on the CC list for the bug.
