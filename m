From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:09:53 +0200
Subject: [Buildroot] [PATCH 1/1] Simple additional patch to allow
 compilation of python-3.6.1 under mipsel-buildroot-linux-musl.
In-Reply-To: <20170421103308.6557-1-mc5686@mclink.it>
References: <20170421103308.6557-1-mc5686@mclink.it>
Message-ID: <20171022160953.193057be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 12:33:08 +0200, Mauro Condarelli wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  .../0005-mips-musl-fix-sgidefs_h-not-found-error.patch       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/libffi/0005-mips-musl-fix-sgidefs_h-not-found-error.patch

We finally got to this patch, and I pushed an improved version of it,
i.e with a better commit log and patch description.

See
https://git.buildroot.org/buildroot/commit/?id=4852f05907cd365825f37c283a415a77ba1fcba9.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
