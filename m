From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Feb 2017 23:12:42 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-02-20
In-Reply-To: <20170221230119.5750f9cd@gmx.net>
References: <20170221072902.80C59207F9@mail.free-electrons.com>
 <20170221224230.245a035a@gmx.net>
 <20170221224804.5f901ab5@free-electrons.com>
 <20170221230119.5750f9cd@gmx.net>
Message-ID: <20170221231242.108c3ac4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Feb 2017 23:01:19 +0100, Peter Seiderer wrote:

> > But indeed, for the release, disabling unsupported architectures is
> > probably best. Can you send a patch?  
> 
> Can do..., depending on BR2_xtensa or (BR2_xtensa && BR2_TOOLCHAIN_USES_UCLIBC)?

Is it C library specific? I don't think it is.

Also, it's not only xtensa, but also arc and nios2 (at least).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
