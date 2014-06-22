From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:03:57 +0200
Subject: [Buildroot] [PATCH 2/4] legal-info: save license files even for
 local or overridden packages
In-Reply-To: <4970d4e28d1f96838b0f62c52852ea9d531faec2.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
 <4970d4e28d1f96838b0f62c52852ea9d531faec2.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <20140622220357.4fe19757@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Jun 2014 14:41:13 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Even if we do not save the sources for local or overridden packages because
> it is too complex, we can still quite easily save the license files.
> 
> Also, having the license files is a very important part of complying with
> the licenses.
> 
> Move the copy of license files out of the non-local, non-overridden package
> case, but still in the case where packages have a _SOURCE defined, to
> avoid catching packages bundled in Buildroot (eg. mkpasswd et al.)
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
