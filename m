From: Gururaja Hebbar K R <gururajakr@sanyo.co.in>
Date: Tue, 22 Apr 2008 07:28:49 +0530
Subject: [Buildroot] Improper device nodes created
	insideproject_build_arm/uclibc/root/dev/
References: <16803332.post@talk.nabble.com>
	<20080421140757.GC21702@cloud.net.au>
	<16819059.post@talk.nabble.com>
	<20080422005042.GA19794@cloud.net.au>
Message-ID: <5BF78BCE8D9BF14A83F836BD9E3916BA0DDC58@blrms.slti.sanyo.co.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Thanks for the help.

> The build process is not intended to create proper device nodes on
desk (non-root user can't do that)
i have logged into console with su root. i am using root shell for this

root at guru_vlinux:/opt/buildroot_plain# whoami
root

>You could mount a generated image file somewhere via the loopback
device. 
>
>Finally you could use something other than NFS root, if you don't need
to write back to it. Perhaps have your boot loader load a ramdisk via
tftp.
yes i tried this and this is working fine. But i am doing a development
project and i need to update the root all the time. so i use NFS boot.

>Alternatively you could add a new target output format for NFS root.
I need to do little study for this. once i know abt this i will try to
create a patch and send it to buildroot.

Regards
Gururaja
