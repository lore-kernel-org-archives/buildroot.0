From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:30:38 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/uvw: new package
In-Reply-To: <20191026140204.14776-1-asafka7@gmail.com>
References: <20191026140204.14776-1-asafka7@gmail.com>
Message-ID: <20191026163038.772f31a6@windsurf.home>
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

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
