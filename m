From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Sep 2017 21:55:01 +0200
Subject: [Buildroot] [PATCH 1/1] configs/galileo: update to kernel with
 gcc6 fix
In-Reply-To: <20170904224839.8036-1-sielicki@yandex.com>
References: <20170904224839.8036-1-sielicki@yandex.com>
Message-ID: <20170905215501.7709e151@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Sep 2017 17:48:39 -0500, Nicholas Sielicki wrote:
> The kernel used for the galileo boards would not successfully build with
> GCC versions greater than 5.
> 
> See: https://github.com/mdr78/Linux-x1000/pull/2
> 
> Signed-off-by: Nicholas Sielicki <sielicki@yandex.com>
> ---
>  configs/galileo_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
