From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 1 May 2020 08:57:49 +0200
Subject: [Buildroot] [PATCH 1/1] libuv, uvw: bump to versions 1.37.0,
 2.5.0_libuv-v1.37
In-Reply-To: <CALFsTFXDXoJ5OAzMUOrOdvtPZ5K8O909aRWxg64sEA58QzytAA@mail.gmail.com>
References: <20200425142239.444381-1-asafka7@gmail.com>
 <20200429215631.786c9de5@windsurf.home>
 <CALFsTFXDXoJ5OAzMUOrOdvtPZ5K8O909aRWxg64sEA58QzytAA@mail.gmail.com>
Message-ID: <20200501085749.7f4f4cc0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 1 May 2020 09:42:31 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> > This update of libuv is causing a build regression in nodejs:
> >
> >   https://bugs.busybox.net/show_bug.cgi?id=12826
> >
> > See also:
> >
> >   http://autobuild.buildroot.net/?reason=nodejs%
> >
> > Could you have a look ?
> >  
> 
> Something with the nodejs autobuild failure looks strange to me.
> I'm not sure the recent bump of libuv/uvw is the reason for that
> failure, as I see
> it's broken for the same reason for a very long time.
> For example, this failure from the beginning of the month is the same:
> http://autobuild.buildroot.net/results/af8/af82fd236b536bf1415e5992ca749cd640abd7e9/build-end.log
> In addition, there's no build failure of nodejs since April 20.
> Moreover, I've managed to build nodejs with the same configuration
> stated in the issue.

My statement was mainly based on the bug report at
https://bugs.busybox.net/show_bug.cgi?id=12826 where the reporter
claimed that reverting commit 7d9ed0a19d8e88b56b389187c38b44563e33e5ab
fixed the issue.

> > By the way, could you create an account on our bug tracker so that we
> > can assign issues to you when relevant ?  
> 
> Yes, I've opened an account.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
