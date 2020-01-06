From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jan 2020 21:52:46 +0100
Subject: [Buildroot] [PATCH] lua-codegen: new package
In-Reply-To: <20190905080839.11940-1-francois.perrad@gadz.org>
References: <20190905080839.11940-1-francois.perrad@gadz.org>
Message-ID: <20200106215246.544db15c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Thu,  5 Sep 2019 10:08:39 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/Config.in                    |  1 +
>  package/lua-codegen/Config.in        |  6 ++++++
>  package/lua-codegen/lua-codegen.hash |  3 +++
>  package/lua-codegen/lua-codegen.mk   | 12 ++++++++++++
>  4 files changed, 22 insertions(+)
>  create mode 100644 package/lua-codegen/Config.in
>  create mode 100644 package/lua-codegen/lua-codegen.hash
>  create mode 100644 package/lua-codegen/lua-codegen.mk

Thanks, I've applied. However, I'd like to point out that the link
fperrad.github.com/lua-CodeGen from
https://luarocks.org/modules/fperrad/lua-codegen is broken, and the
link http://github.com/fperrad/lua-CodeGen/releases/ from
https://fperrad.frama.io/lua-CodeGen/ is also broken.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
