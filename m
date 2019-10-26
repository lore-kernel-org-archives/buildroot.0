From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 19:43:17 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/uvw: new package
In-Reply-To: <20191026140204.14776-1-asafka7@gmail.com>
References: <20191026140204.14776-1-asafka7@gmail.com>
Message-ID: <20191026194317.1f32c85a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Oct 2019 17:02:04 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> A header-only libuv wrapper in C++.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
> v3->v4:
>  * gcc 7.x is now OR'ed with NPTL and dynamic library.
>  * use UVW_SUPPORTS_IN_SOURCE_BUILD = NO.

This patch causes a Doxygen issue:
http://autobuild.buildroot.net/results/9c6/9c61c06142c832a9669afdcafcbb8b1f7df51082/build-end.log

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
