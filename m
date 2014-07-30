From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 23:51:33 +0200
Subject: [Buildroot] [PATCH] polarssl: disable microblaze inline assembly
In-Reply-To: <1406746574-15628-1-git-send-email-gustavo@zacarias.com.ar>
References: <1406746574-15628-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140730235133.7f4a6442@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 30 Jul 2014 15:56:14 -0300, Gustavo Zacarias wrote:
> Fixes:
> http://autobuild.buildroot.net/results/4d5/4d54958ded61a0d929d992e4ca0bb31c996953cb/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../polarssl/polarssl-02-disable-microblaze-asm.patch  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 package/polarssl/polarssl-02-disable-microblaze-asm.patch

Applied. But could you report this issue upstream so that it hopefully
gets fixed in the future? They have a github issue tracker, so it
should be pretty easy to do.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
