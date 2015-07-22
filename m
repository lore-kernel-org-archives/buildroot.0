From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 22:30:51 +0200
Subject: [Buildroot] [PATCH] socketcand: resolve GCC5 related issue
In-Reply-To: <1437591146-12969-1-git-send-email-yegorslists@googlemail.com>
References: <1437591146-12969-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20150722223051.3ebbf80a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yegor Yefremov,

On Wed, 22 Jul 2015 20:52:26 +0200, Yegor Yefremov wrote:
> This patch removes inline keyword from header and source
> files.
> 
> Fixes following autobuild failure:
> http://autobuild.buildroot.net/results/8ea/8eac9832554dbd1f2e14cf54e5c99e6bf4dfc2cc/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .../socketcand/0001-Remove-inline-keyword.patch    | 90 ++++++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 package/socketcand/0001-Remove-inline-keyword.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
