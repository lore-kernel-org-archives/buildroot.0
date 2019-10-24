From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 24 Oct 2019 21:25:29 +0000
Subject: [Buildroot] [Bug 12281] Custom configuration fails to build (based
 on raspberrypi3_defconfig)
In-Reply-To: <bug-12281-163@https.bugs.busybox.net/>
References: <bug-12281-163@https.bugs.busybox.net/>
Message-ID: <bug-12281-163-iA2H9dFDKs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12281

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Still missing 'Attaching .config' ;-)

Searching for 'error: static declaration of ?gettid? follows non-static
declaration' findes the following [1]:

  [Qemu-devel] [PULL 2/2] linux-user: rename gettid() to sys_gettid() to avoid
clash with glibc

Time for quemu update (or cherry-picking the patch)?

[1] https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg01314.html

-- 
You are receiving this mail because:
You are on the CC list for the bug.
