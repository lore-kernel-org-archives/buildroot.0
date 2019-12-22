From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 22 Dec 2019 16:50:14 +0000
Subject: [Buildroot] [Bug 12426] NodeJS slow startup performance (~30s)
In-Reply-To: <bug-12426-163@https.bugs.busybox.net/>
References: <bug-12426-163@https.bugs.busybox.net/>
Message-ID: <bug-12426-163-BloHq1GSET@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12426

--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org> ---
Is this only at first startup or does running nodejs multiple times each time
take ~30s on the RPI? What storage are you using? The prebuilt nodejs
presumably bundles a bunch of dependencies statically, whereas the Buildroot
one uses dynamic linking

-- 
You are receiving this mail because:
You are on the CC list for the bug.
