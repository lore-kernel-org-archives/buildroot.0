From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2020 22:21:34 +0000
Subject: [Buildroot] [Bug 13126] make fails - bzip2-1.0.6.tar.gz and
 DirectFB-1.7.7.tar.gz aren't tarballs
In-Reply-To: <bug-13126-163@https.bugs.busybox.net/>
References: <bug-13126-163@https.bugs.busybox.net/>
Message-ID: <bug-13126-163-DWqnuJX1SC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13126

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
For bzip the solution (for an original download) should be patch [1],
for directfb the sources.buildroot.net mirror should have (untested) the right
source files for download...

The right download should be detected by the stored hash files, see
package/bzip2/bzip2.hash and package/directfb/directfb.hash (and
sources.buildroot.net should provide the packages for all buildroot
releases)...


[1]
https://git.buildroot.net/buildroot/commit/?id=f45976b2c759b1630a2886e75312340b3b511f81

-- 
You are receiving this mail because:
You are on the CC list for the bug.
