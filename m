From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 24 Feb 2020 20:52:06 +0100
Subject: [Buildroot] [PATCH 1/3] package/libyang: enable LYD_PRIV option
In-Reply-To: <20200224172652.30932-2-vadim4j@gmail.com>
References: <20200224172652.30932-1-vadim4j@gmail.com>
 <20200224172652.30932-2-vadim4j@gmail.com>
Message-ID: <20200224205206.622a2c5e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 24 Feb 2020 19:26:50 +0200
Vadim Kochan <vadim4j@gmail.com> wrote:

> This option is required by frr package, so enable it by default.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>

What is this option doing? How much more space does it require? In
other words, do we want to enable it unconditionally, or do we want to
make it optional ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
