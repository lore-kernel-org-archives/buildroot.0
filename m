From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 24 Jul 2019 01:23:30 +0000
Subject: [Buildroot] [Bug 12051] package/dhcp installs libtool wrapper
 scripts on target instead of real binaries
In-Reply-To: <bug-12051-163@https.bugs.busybox.net/>
References: <bug-12051-163@https.bugs.busybox.net/>
Message-ID: <bug-12051-163-lu6ujEYJCv@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12051

Carlos Santos <unixmania@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Build succeeds but leaves a |package/dhcp installs
                   |temporary libtool wrapper   |libtool wrapper scripts on
                   |script for dhcp in the      |target instead of real
                   |rootfs                      |binaries

-- 
You are receiving this mail because:
You are on the CC list for the bug.
