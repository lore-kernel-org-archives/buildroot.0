From: Bill Bogstad <bogstad@pobox.com>
Date: Fri, 28 Aug 2009 12:20:26 -0400
Subject: [Buildroot] Does the kexec package buildroot-2009.05 for i386?
In-Reply-To: <87fxbcro1c.fsf@macbook.be.48ers.dk>
References: <2d6a9f6f0908271429j91a36e9s2342c23762a8552@mail.gmail.com>
	<87fxbcro1c.fsf@macbook.be.48ers.dk>
Message-ID: <2d6a9f6f0908280920q41f09dak9120c88370e14aa1@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 28, 2009 at 10:49 AM, Peter Korsgaard<jacmet@uclibc.org> wrote:
>>>>>> "Bill" == Bill Bogstad <bogstad@pobox.com> writes:
>....
>
> It builds here without any problems. Have you set BR2_JLEVEL to
> something else than 1? Could you please post your .config?

FYI, I'm a total newbie where buildroot is concerned.

Build Host: Ubuntu 8.04 with most native development packages
installed and up to date patches.

I re-ran my build as specified below and still get the same errors:

1. make menuconfig and took all the defaults + adding kexec.  This was
from a clean directory.
2. nohup make

I'll attach the resulting .config just in case, but it should be
easily repeatable on any Ubuntu 8.04 system.

Bill Bogstad

P.S. Interestingly, I just did essentially the same thing with
buildroot-2009.08-rc3 and it builds.  I now have four different config
files 05/08 * kexec/nokexec and the only one that fails is 05 with
kexec.   Oh, I've also tried to build 05 with kexec twice (starting
from unarchiving buildroot tar file) and I get the same error each
time so I don't think it's some hardware problem on my build host.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.kexec.05
Type: application/octet-stream
Size: 18050 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090828/79fc0ca9/attachment-0001.obj>
