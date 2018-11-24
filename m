From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 10:13:40 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/{dovecot,
 dovecot-pigeonhole}: bump version to 2.3.4, 0.5.4
In-Reply-To: <20181124085145.26234-1-bernd.kuhls@t-online.de>
References: <20181124085145.26234-1-bernd.kuhls@t-online.de>
Message-ID: <20181124101340.23cf7915@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 24 Nov 2018 09:51:45 +0100, Bernd Kuhls wrote:
> We need to bump both packages in one commit:
> 
> https://dovecot.org/pipermail/dovecot-news/2018-November/000392.html
> 
>  Adjustments to several changes in Dovecot v2.3.4 make this Pigeonhole
>  release dependent on that Dovecot release; it will not compile against
>  older Dovecot versions. And, conversely, you need to upgrade
>  Pigeonhole when upgrading Dovecot to v2.3.4.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/dovecot-pigeonhole/dovecot-pigeonhole.hash | 2 +-
>  package/dovecot-pigeonhole/dovecot-pigeonhole.mk   | 2 +-
>  package/dovecot/dovecot.hash                       | 2 +-
>  package/dovecot/dovecot.mk                         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
