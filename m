From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 21:56:31 +0200
Subject: [Buildroot] [PATCH 1/1] libuv, uvw: bump to versions 1.37.0,
 2.5.0_libuv-v1.37
In-Reply-To: <20200425142239.444381-1-asafka7@gmail.com>
References: <20200425142239.444381-1-asafka7@gmail.com>
Message-ID: <20200429215631.786c9de5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 25 Apr 2020 17:22:39 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/libuv/libuv.hash | 2 +-
>  package/libuv/libuv.mk   | 2 +-
>  package/uvw/uvw.hash     | 2 +-
>  package/uvw/uvw.mk       | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

This update of libuv is causing a build regression in nodejs:

  https://bugs.busybox.net/show_bug.cgi?id=12826

See also:

  http://autobuild.buildroot.net/?reason=nodejs%

Could you have a look ?

By the way, could you create an account on our bug tracker so that we
can assign issues to you when relevant ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
