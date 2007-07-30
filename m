From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 30 Jul 2007 09:24:31 +0200
Subject: [Buildroot] latest svn trunk build saga
In-Reply-To: <0707291433290.8510@somehost>
References: <0707282336490.8510@somehost> <0707291433290.8510@somehost>
Message-ID: <20070730072430.GC21479@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 29, 2007 at 03:12:08PM +0200, Cristian Ionescu-Idbohrn wrote:
>Replying to myself again.
>
>On Sat, 28 Jul 2007, Cristian Ionescu-Idbohrn wrote:

>> --------------------------------------------------------------------------
>> buildroot/build_i486/staging_dir/usr/bin/fakeroot -- buildroot/build_i486/staging_dir/_fakeroot.rootfs.i486.ext2
>> rootdir=buildroot/project_build_i486/uclibc/root
>> table='target/generic/mini_device_table.txt'
>> makedevs: line 53: regular file 'buildroot/project_build_i486/uclibc/root/usr/share/udhcpc/default.script' does not exist: No such file or directory
>
>This occurs because:
>
>	buildroot/build_i486/staging_dir/bin/makedevs \
>		-d target/generic/mini_device_table.txt \
>		buildroot/project_build_i486/uclibc/root
>
>does not find /usr/share/udhcpc/default.script pointed out by
>target/generic/mini_device_table.txt (on line 53); and that is because
>busybox-1.6.1 I use does not include that file.

This is perfectly fine and needed for ancient busybox version. Ignore
this.
