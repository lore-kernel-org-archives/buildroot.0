From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Jan 2019 22:57:00 +0100
Subject: [Buildroot] [PATCH v3 2/5] testing/infra/basetest: support
 br2-external
In-Reply-To: <20190128232209.17485-3-aduskett@gmail.com>
References: <20190128232209.17485-1-aduskett@gmail.com>
 <20190128232209.17485-3-aduskett@gmail.com>
Message-ID: <20190129225700.6c01cc19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Jan 2019 18:22:06 -0500
aduskett at gmail.com wrote:


>          if not self.b.is_finished():
>              self.show_msg("Building")
> -            self.b.configure()
> +            self.b.configure(["BR2_EXTERNAL={}".format(":".join(self.br2_external))])

I made things explicit by using named arguments, i.e
make_extra_opts=...

Applied to master with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
