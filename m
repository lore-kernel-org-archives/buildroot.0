From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Aug 2019 10:29:28 +0200
Subject: [Buildroot] [Lua 0/2] Lua modules removal
In-Reply-To: <CAB0FRsuz74nnfJsOwmLZ6CyXN32S3E3fM4FhAqo4LpZ8i5Q4mw@mail.gmail.com>
References: <20190608211827.7731-1-francois.perrad@gadz.org>
 <cb9f5645-6484-7ccc-ca81-3e79ccb51a9d@mind.be>
 <CAB0FRsv_L8kG_g5uXdd=80WJptzRFvZ1EFpSwuS3A8P5Xu1-6A@mail.gmail.com>
 <1994ec5b-511f-2314-d54b-6ec18bc63a74@mind.be>
 <CAB0FRsuz74nnfJsOwmLZ6CyXN32S3E3fM4FhAqo4LpZ8i5Q4mw@mail.gmail.com>
Message-ID: <20190803102928.07c40c83@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Mon, 10 Jun 2019 19:02:58 +0200
Fran?ois Perrad <francois.perrad@gadz.org> wrote:

> >  So, aren't these two packages relevant for LuaJIT then?
> >
> These two modules could be loaded/used by LuaJIT, but in practice, I don't
> think they are.

This is not a very convincing argument. If you really want those
packages to be removed, could you send a new iteration of the series
that clearly explains in the commit log why the package is removed. Or
perhaps they should be kept, and just the "depends on
BR2_PACKAGE_LUA_5_1" be removed when you remove Lua 5.1 ?

In the mean time, I'll mark the series as Changes Requested in
patchwork.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
