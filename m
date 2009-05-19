From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 May 2009 09:40:58 +0200
Subject: [Buildroot] Kernelmessage during boot: "VFS: Mounted root (ext3
	filesystem) readonly on device 3:1."
In-Reply-To: <20090519072234.133410@gmx.net> (xoro@gmx.eu's message of "Tue\,
	19 May 2009 09\:22\:34 +0200")
References: <20090519072234.133410@gmx.net>
Message-ID: <87my99mtf9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "xoro" == xoro  <xoro@gmx.eu> writes:

 xoro> Hi,
 xoro> I'am testing the buildroot system I created with VirtualBox.
 xoro> I used the build-ext3-script to create a harddisk image that I converted
 xoro> using qemu-img and VBoxManage.

 xoro> During the startup I always get the following kernel message:
 xoro> VFS: Mounted root (ext3 filesystem) readonly on device 3:1.

 xoro> I was already looking in the buildroot configuration but I couldn't find
 xoro> any option to set if the filesystem is read-only or writeable.

 xoro> Is the filesystem made writeable by the buildroot, busybox or the linux
 xoro> configuration?
 xoro> Where can I make the filesystem writeable?

Make sure you have 'rw' on your kernel cmdline in qemu.

-- 
Bye, Peter Korsgaard
