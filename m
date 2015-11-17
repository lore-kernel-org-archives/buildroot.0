From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Nov 2015 12:19:05 +0100
Subject: [Buildroot] [PATCH 02/21 RFC] core/legal-info: fix missing
 double-$
In-Reply-To: <b69ba63b4767fb645f71ac115573b885f62445ed.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
 <b69ba63b4767fb645f71ac115573b885f62445ed.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <20151117121905.14107076@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 16 Nov 2015 23:46:57 +0100, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I tested by running "make legal-info" on a configuration that uses an
external toolchain, and it properly downloaded the "actual source" for
the toolchain.

This should be applied on master I believe.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
