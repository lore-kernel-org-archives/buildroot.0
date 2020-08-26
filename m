From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Aug 2020 23:11:14 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/libyang: enable LYD_PRIV
 option for frr package
In-Reply-To: <20200225155322.8440-2-vadim4j@gmail.com>
References: <20200225155322.8440-1-vadim4j@gmail.com>
 <20200225155322.8440-2-vadim4j@gmail.com>
Message-ID: <20200826231114.2aae23cd@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 25 Feb 2020 17:53:21 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> This option is required by frr package, so enable it by default as there
> is no size difference with or without this option enabled.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/libyang/libyang.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
