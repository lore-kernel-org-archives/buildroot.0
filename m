From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Jan 2014 20:08:21 +0100
Subject: [Buildroot] buildroot(busybox) problem with ccache during
 rtai-4.0-test2 compiling.
In-Reply-To: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
References: <CAEqQue1sX4nntqoAS-Rynro_8GDkD7hAUd+_CTHDXft_Z0U=CA@mail.gmail.com>
Message-ID: <20140130200821.2c0559d8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Jan 2014 19:23:38 +0530, servo gmrt wrote:
> Dear All,
> 
> I am trying to build rtai-4.0-test2 but it fails on my system
> 
> I am using buildroot-2014.02 version
> 
> When I compile the RTAI-4.0-test2 version I am getting the following error
> messages,

Please provide the patches you applied to Buildroot in order to build
RTAI 4.0, so that we can reproduce the problem.

> `/run/media/thiyagu/data/buildroot/output/build/rtai-4.0-test2/base/arch/x86/hal'
> /run/media/thiyagu/data/buildroot/output/host/usr/bin/ccache: invalid
> option -- 'E'

This is most likely caused by missing quotes around $(CC) somewhere,
but we would have to reproduce.

> Please help to resolve the issue.

Only if you provide the necessary elements :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
