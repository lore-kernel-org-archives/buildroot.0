From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 07 Jul 2014 16:05:15 +0200
Subject: [Buildroot] systed-remount-fs rootfs issue
In-Reply-To: <53B54052.6040900@gmail.com>
References: <53B54052.6040900@gmail.com>
Message-ID: <2088985.2aUruBLr1Y@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathaniel,

On Thursday 03 July 2014 19:36:50 Nathaniel Roach wrote:
> Hi!
> 
> I'm trying to get buildroot working on an x86_64 machine (pentium d) and
> I was having some trouble getting root as rw. I've found that even if /
> is set to mount rw in fstab, systemd-remount-fs doesn't mount it as rw
> (as from what I've read it should).
In order to help you, can you provide a few additional information?

Does systemctl report remount-rootfs.service as failed? What happens if you 
try to remount your filesystem manually (by doing "mount -o remount,rw /")? 

What is type of your filesystem? NFS?

Is your mount command is provided by busybox?

(I have already found some issues with NFS and busybox mount command)

-- 
J?r?me Pouiller - Sysmic
Expert Linux embarqu?
