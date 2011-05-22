From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Sun, 22 May 2011 16:58:32 +0200
Subject: [Buildroot] [git commit] toolchain/crosstool-NG: bundle one CT-NG
	config file for each libc familly
Message-ID: <20110522145940.9BA158356F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f5268b171a04e9fe286d88117d9590d7e68df754
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the bundled CT-NG config file has no C library configured.
It is quite complex to add and/or munge options in this case.

Now, with one config file per libc familly, it becomes easier.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>

Patch is too large, so refusing to show it
