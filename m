From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 20:41:19 +0100
Subject: [Buildroot] [PATCH] php-gnupg: force gnupg detection
In-Reply-To: <1393698381-21984-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393698381-21984-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301204119.052baba1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat,  1 Mar 2014 15:26:21 -0300, Gustavo Zacarias wrote:
> Hardcode the gpg path and detection otherwise it will fail on a host
> that doesn't have gnupg installed. Fixes:
> http://autobuild.buildroot.net/results/757/757fb0b12af12de4f128d9c503d45b20776c2313/
> Also define PHP_AUTOCONF and PHP_AUTOHEADER as other extensions do to
> avoid stray issues.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/php-gnupg/php-gnupg.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
