From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 14:54:34 +0200
Subject: [Buildroot] [pull request] Pull request for branch fs-cleanup
In-Reply-To: <8739z5kmmy.fsf@macbook.be.48ers.dk>
References: <cover.1270803901.git.thomas.petazzoni@free-electrons.com>
	<8739z5kmmy.fsf@macbook.be.48ers.dk>
Message-ID: <20100409145434.3fd2aa6f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 09 Apr 2010 11:20:37 +0200
Peter Korsgaard <jacmet@uclibc.org> wrote:

>  Thomas> This patchset implements a major rework of the code that
>  Thomas> generates the root filesystem generation. It is part of a more
>  Thomas> general work that aims at cleaning up the contents of the
>  Thomas> target/ directory.
> 
>  Thomas> Each patch has a description detailing its changes but here is
>  Thomas> the list of the major steps that this patch set goes through :
> 
> Looks very good, thanks!

Thanks. As I said, there are probably some issues left here and there,
but that's not the scariest part of the target/ directory cleanup :-)

> The squashfs 4.0 filesystem exists for 1 year now, so it's quite new
> (and tied to kernel versions) - Aren't we leaving people with older
> kernels out in the cold?
> 
> Maybe now is the time to get rid of the old version, I don't know - But
> 3.4 was not marked as deprecated (only recent) in 2010.02.

As discussed on IRC, I've sent a new pull request for my "squashfs3"
branch which re-introduces squashfs 3.x support, marked as
BR2_DEPRECATED.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
