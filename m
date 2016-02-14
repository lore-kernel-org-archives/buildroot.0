From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 15 Feb 2016 00:00:48 +0100
Subject: [Buildroot] [PATCH 16/16 v4] core/pkg-virtual: ignore from
 legal-info output
In-Reply-To: <758fb04b86bec833cd306ab5678d18504920bd54.1454536753.git.yann.morin.1998@free.fr>
References: <cover.1454536753.git.yann.morin.1998@free.fr>
 <758fb04b86bec833cd306ab5678d18504920bd54.1454536753.git.yann.morin.1998@free.fr>
Message-ID: <56C10720.30109@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 03/02/2016 23:22, Yann E. MORIN wrote:
> Virtual packages really have nothing to save for legal-info, so we just
> ignore them, to avoid spurious "extracting" and "patching" messages
> while running legal-info.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
[Tested before/after patch on a small config with jpeg-turbo]
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
