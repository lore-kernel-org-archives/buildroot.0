From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri, 1 May 2020 09:42:31 +0300
Subject: [Buildroot] [PATCH 1/1] libuv, uvw: bump to versions 1.37.0,
 2.5.0_libuv-v1.37
In-Reply-To: <20200429215631.786c9de5@windsurf.home>
References: <20200425142239.444381-1-asafka7@gmail.com>
 <20200429215631.786c9de5@windsurf.home>
Message-ID: <CALFsTFXDXoJ5OAzMUOrOdvtPZ5K8O909aRWxg64sEA58QzytAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, Apr 29, 2020 at 10:56 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 25 Apr 2020 17:22:39 +0300
> Asaf Kahlon <asafka7@gmail.com> wrote:
>
> > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> > ---
> >  package/libuv/libuv.hash | 2 +-
> >  package/libuv/libuv.mk   | 2 +-
> >  package/uvw/uvw.hash     | 2 +-
> >  package/uvw/uvw.mk       | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
>
> This update of libuv is causing a build regression in nodejs:
>
>   https://bugs.busybox.net/show_bug.cgi?id=12826
>
> See also:
>
>   http://autobuild.buildroot.net/?reason=nodejs%
>
> Could you have a look ?
>

Something with the nodejs autobuild failure looks strange to me.
I'm not sure the recent bump of libuv/uvw is the reason for that
failure, as I see
it's broken for the same reason for a very long time.
For example, this failure from the beginning of the month is the same:
http://autobuild.buildroot.net/results/af8/af82fd236b536bf1415e5992ca749cd640abd7e9/build-end.log
In addition, there's no build failure of nodejs since April 20.
Moreover, I've managed to build nodejs with the same configuration
stated in the issue.

> By the way, could you create an account on our bug tracker so that we
> can assign issues to you when relevant ?

Yes, I've opened an account.

>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Regards,
Asaf.
