From: don <don_reid@comcast.net>
Date: Thu, 14 Sep 2006 10:22:28 -0700
Subject: [Buildroot] [BUILDROOT] root file system is mounted as ro
In-Reply-To: <168bf0160609140029r77cb95b1mbfa7d32624c615d@mail.gmail.com>
References: <168bf0160609140029r77cb95b1mbfa7d32624c615d@mail.gmail.com>
Message-ID: <20060914172228.GA12778@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 14, 2006 at 09:29:49AM +0200, Thomas Surrel wrote:
> Hi,
> 
> I have a problem with recent buildroot : when booting Linux, the root
> file system is always mounted as ro,...

I have this in etc/inittab

	null::sysinit:/bin/mount -o remount,rw /	

Of course you need a file system that is writable like ext2.

Don
