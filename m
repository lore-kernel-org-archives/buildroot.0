From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Jan 2015 18:35:13 +0100
Subject: [Buildroot] [PATCH] dmalloc: fix parallel builds
In-Reply-To: <20150103110503.GA11955@vostro>
References: <20150103110503.GA11955@vostro>
Message-ID: <20150104183513.0cdff028@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Suykov,

On Sat, 3 Jan 2015 13:05:03 +0200, Alex Suykov wrote:
> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
> ---
>  This patch should fix
>  http://autobuild.buildroot.net/results/2cc40ae3fc8b7a287c43528b3e4ffdbcd5033c09/
> 
>  package/dmalloc/dmalloc-deps.patch | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 package/dmalloc/dmalloc-deps.patch

While it indeed looks like a parallel build issue, I haven't been able
to reproduce it: I've started a loop building dmalloc over and over
again on my build server (on which the issue was reproduced by the
autobuilders), and never managed to see it after an entire night
looping on dmalloc builds. So I'm a bit confused on this one.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
