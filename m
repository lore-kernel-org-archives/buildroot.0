From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Aug 2015 22:35:00 +0200
Subject: [Buildroot] [PATCH] [autobuild] package/libnetfilter_queue: fix
 build with musl
In-Reply-To: <1439735927-10364-1-git-send-email-yann.morin.1998@free.fr>
References: <1439735927-10364-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150817223500.57292a81@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 16 Aug 2015 16:38:47 +0200, Yann E. MORIN wrote:
> Backport a patch from upstream.
> 
> Fixes:
>     http://autobuild.buildroot.org/results/59b/59bd31c10a0d445d2ea56550a36920ecb2ef89ed/
>     http://autobuild.buildroot.org/results/60a/60ab98b4cf909b04a57207b2326e9f8080d1721b/
>     http://autobuild.buildroot.org/results/7db/7db3a5c2bebabfdc26947f45382893bb14656617/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/libnetfilter_queue/0002-musl.patch | 45 ++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libnetfilter_queue/0002-musl.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
