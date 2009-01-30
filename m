From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 30 Jan 2009 12:24:15 +0100
Subject: [Buildroot] Broken symbolic links in generated toolchain
Message-ID: <20090130122415.2c585016@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I just grabbed -rc2 and simply generated a MIPS toolchain (no
packages).

After generation, the STAGING_DIR has two broken symbolic links:

 mips-linux -> mips-linux-uclibc
 usr/bin/cc -> usr/bin/gcc

While not preventing the toolchain from working, it always seems
strange to have broken symlinks.

.config file attached.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 19050 bytes
Desc: not available
Url : http://lists.busybox.net/pipermail/buildroot/attachments/20090130/28750706/attachment-0001.obj 
