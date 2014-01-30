From: Kaspar Emanuel <kaspar.emanuel@gmail.com>
Date: Thu, 30 Jan 2014 14:42:38 +0000
Subject: [Buildroot] jffs2 errors on ubifs rootfs
In-Reply-To: <20140130150759.138aae27@e6520eb>
References: <CAB+dmji48fxFuUPJrq7EhL4QC+Amw4ZiNRe=oiBArPeCPPw-Ow@mail.gmail.com>
 <20140130150759.138aae27@e6520eb>
Message-ID: <CAB+dmjihqGRaPSw-n-aeZ5wuJhR_mKHekaBDxWbwL13P6aBf9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30 January 2014 14:07, Eric B?nard <eric@eukrea.com> wrote:
> your rootfs mounts fine (VFS: Mounted root (ubifs filesystem) readonly
> on device 0:12.), the jffs2 log comes after : aren't you trying to mount
> a jffs2 filesystem in an initscript or in fstab ?

Yep, that was it. There was a mount squirreled away somewhere in some
init script (not fstab, I did check that before).  Thanks!
