From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 20 Mar 2020 17:26:01 +0000
Subject: [Buildroot] [Bug 12686] recipe for target 'install_dev' failed
 (libcrypto.so: file format not recognized)
In-Reply-To: <bug-12686-163@https.bugs.busybox.net/>
References: <bug-12686-163@https.bugs.busybox.net/>
Message-ID: <bug-12686-163-qeUuQdmQRo@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12686

--- Comment #1 from Peter Seiderer <ps.report@gmx.net> ---
Please try a complete re-build:

    make clean
    make

If it fails again, please provide a complete .config file (or defconfig - after
make savedefconfig)...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
