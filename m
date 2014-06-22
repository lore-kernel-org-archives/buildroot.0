From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 22:05:10 +0200
Subject: [Buildroot] [PATCH 4/4] legal-info: rename
 legal-warning-pkg-savednothing helper
In-Reply-To: <1b7669d8f5b489b6c8b2b3394ba1207c903a9e68.1403439879.git.yann.morin.1998@free.fr>
References: <cover.1403439879.git.yann.morin.1998@free.fr>
 <1b7669d8f5b489b6c8b2b3394ba1207c903a9e68.1403439879.git.yann.morin.1998@free.fr>
Message-ID: <20140622220510.523c0092@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 22 Jun 2014 14:41:15 +0200, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> This helper was called when none of the sources or license
> files were saved.
> 
> Now we handle license files separately from the sources,
> this is no longer the case: they are only called when the
> sources are not saved.
> 
> Rename the handler and change the warning message accordingly.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Fabio Porcedda <fabio.porcedda@gmail.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
