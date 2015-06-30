From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:27:38 +0200
Subject: [Buildroot] [PATCH] monkey: fix building with debugging symbols
In-Reply-To: <1435661720-25725-1-git-send-email-bgolaszewski@baylibre.com>
References: <1435661720-25725-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <20150630142738.79afe03c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bartosz Golaszewski,

On Tue, 30 Jun 2015 12:55:20 +0200, Bartosz Golaszewski wrote:
> Fix a typo in the monkey package - should be MONKEY_CONF_OPTS
> instead of MONKEY_CONF_OPT.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  package/monkey/monkey.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Indeed, I missed that. Thanks for spotting, applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
