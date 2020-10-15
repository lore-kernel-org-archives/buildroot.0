From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 23:46:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-14
In-Reply-To: <CAFOYHZA9MRAh3FiN6J3KQMZU+YZ_bfTGQ42PJ_wzc7z6Pic5Xg@mail.gmail.com>
References: <5f87f5a4.1c69fb81.d48c1.9811SMTPIN_ADDED_MISSING@mx.google.com>
 <CAFOYHZA9MRAh3FiN6J3KQMZU+YZ_bfTGQ42PJ_wzc7z6Pic5Xg@mail.gmail.com>
Message-ID: <20201015234622.6fe59577@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Chris,

On Fri, 16 Oct 2020 10:33:14 +1300
Chris Packham <judge.packham@gmail.com> wrote:

> >     arch     |             reason             |                                       url
> > -------------+--------------------------------+---------------------------------------------------------------------------------
> >    xtensa    |        micropython-1.13        | http://autobuild.buildroot.net/results/174b825379b0f025b0512a3fafd17235c9914a03
> >  
> 
> The error is complaining about some in-line asm code. I don't know
> much about xtensa so I've raised an upstream issue
> https://github.com/micropython/micropython/issues/6551

This pretty clearly looks like an Xtensa toolchain issue, so I've added
Max Filippov in Cc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
