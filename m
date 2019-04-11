From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:33:34 +0200
Subject: [Buildroot] [PATCH 06/10] infra/pkg-generic: introduce
 foo-show-info
In-Reply-To: <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <6e3c4eccb009f45ccb25b549c88e6a6603091ddb.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <20190411193334.072b8f1f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Apr 2019 13:51:21 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> +ifeq ($$($(2)_IS_VIRTUAL),YES)
> +define $(2)_SHOW_INFO_VIRTUAL
> +	"virtual": true,
> +endef
> +else
> +define $(2)_SHOW_INFO_VIRTUAL

I am not too happy with the name _SHOW_INFO_VIRTUAL, because it is not
at all used just for virtual packages. I don't really have a very good
suggestion, though. _SHOW_INFO_DETAILS ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
