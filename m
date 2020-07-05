From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Jul 2020 22:59:21 +0200
Subject: [Buildroot] [PATCH] fs/ubi: expose BINARIES_DIR to ubinize.cfg
In-Reply-To: <20200606105015.1603519-1-alexandre.belloni@bootlin.com>
 (Alexandre Belloni's message of "Sat, 6 Jun 2020 12:50:15 +0200")
References: <20200606105015.1603519-1-alexandre.belloni@bootlin.com>
Message-ID: <87pn9965li.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@bootlin.com> writes:

 > It is often necessary to refer to other images that are present in
 > BINARIES_DIR from a custom ubinize configuration e.g. to include the kernel
 > in a UBI volume.

 > As for BR2_ROOTFS_UBIFS_PATH, replace BINARIES_DIR when copying the file.

 > Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

While not strictly a bugfix, it seems pretty simple and a sensible thing
to do, so committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
