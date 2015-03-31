From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 14:01:06 +0200
Subject: [Buildroot] [PATCH] polarssl: switch download URL
In-Reply-To: <1427799560-9170-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427799560-9170-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150331140106.4344566c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 07:59:20 -0300, Gustavo Zacarias wrote:
> Old wget versions aren't very happy with https moves/alt names hence
> complain when trying to download from said sites.
> Since polarssl is now mbed tls and everything got renamed switch to the
> new URL to avoid this.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/polarssl/Config.in   | 2 +-
>  package/polarssl/polarssl.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
