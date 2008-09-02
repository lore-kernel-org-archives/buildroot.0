From: Steven Woody <narkewoody@gmail.com>
Date: Tue, 2 Sep 2008 23:03:43 +0800
Subject: [Buildroot] Make error
In-Reply-To: <87bpz6vfq5.fsf@macbook.be.48ers.dk>
References: <ed4892840808301750t13e320a6ne218b2a0e96168f@mail.gmail.com>
	<87od3966tr.fsf@macbook.be.48ers.dk>
	<ed4892840808310034y2b352388q9dd2ff90a614ee13@mail.gmail.com>
	<ed4892840808310213w4e9edea5wa69beac5ebf7c7eb@mail.gmail.com>
	<87bpz6vfq5.fsf@macbook.be.48ers.dk>
Message-ID: <ed4892840809020803l5705350flc6d69e5e93380f6e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 2, 2008 at 9:29 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Steven" == Steven Woody <narkewoody@gmail.com> writes:
>
> Hi,
>
>  Steven> Wait a moment ...!   After I turned on the 'avahi' in networking
>  Steven> section and run make, I got the following error instead:
>
>  Steven> cannot find -lintl
>  Steven> collect2: ld returned 1 exit status
>  Steven> make[3]: *** [libavahi-common.la] Error 1
>
>  Steven> What do I do? Thanks.
>
> Strange. Avahi should depend (and select) libintl if you use a
> toolchain with locales enabled. Could you post your config please?
>

Thans Peter. The problem has gone many days befoer after I rebuilt
from a fresh new buildroot untar-ed from the same tarball and copied
the old .config as well as the 'dl' directory.  So I guess its the
'make' process which mess something up.

I have related question:  some times, I want to rebuid a new rootfs
directory tree (project_arm_build/uClibc/root), so I go to remove the
whole .../root directory as well as the .root file followed by re-run
'make', but I always get an error (I forgot the detail, but can
remember it's because the re-created .../root/ tree doesn't get a
usr/lib directory, and some thing need to be copied there, so the
error pops up).   My question is: How can I forece to rebuid the whole
project_arm_build/uClibc/root tree?  Thanks.

-
narke
