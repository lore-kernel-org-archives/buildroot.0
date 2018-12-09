From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:29:42 +0100
Subject: [Buildroot] [PATCH 1/3] package/pkg-rebar.mk: Fix
 remove-rebar-config-dependencies
In-Reply-To: <20181205160618.6884-1-johan.oudinet@gmail.com>
References: <20181205160618.6884-1-johan.oudinet@gmail.com>
Message-ID: <20181209172942.381068ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Dec 2018 17:06:16 +0100, Johan Oudinet wrote:
> Handle the case where there is only one dependency described in
> rebar.config, so when the line starts by '{deps' and ends by '}.'.
> Before it was deleting this line but also all next lines until finding
> a line that ends by '}.'.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/pkg-rebar.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Series applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
