From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 06 Nov 2020 07:28:10 +0000
Subject: [Buildroot] [Bug 13296] host-libcap failed to build
In-Reply-To: <bug-13296-163@https.bugs.busybox.net/>
References: <bug-13296-163@https.bugs.busybox.net/>
Message-ID: <bug-13296-163-Do0tpDkPbc@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13296

--- Comment #7 from Dr I J Ormshaw <ian_ormshaw@waters.com> ---
I am still seeing the same error, with either version of the patch after doing
the following:

1) Deleting my build directory.
2) Checking out the source from tag 2020.11-rc1
3) In the where the source is checked out applying the patch with:
     patch -p1  -i <path to
patch>/0001-package-libcap-fix-building-on-host-package.patch
4) Copying my config file to the build directoty
5) Building buildroot

-- 
You are receiving this mail because:
You are on the CC list for the bug.
