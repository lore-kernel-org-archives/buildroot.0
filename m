From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 11:37:48 +0200
Subject: [Buildroot] [PATCH v3] infra/pkg-autotools: cleanup the
 gettextize step
In-Reply-To: <1405717351-3820-1-git-send-email-yann.morin.1998@free.fr>
References: <1405717351-3820-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140719113748.5630b549@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 18 Jul 2014 23:02:31 +0200, Yann E. MORIN wrote:
> Align the way we call gettextize to the way we call autoreconf:
>   - provide the $(GETTEXTIZE) variable
>   - pass $(HOST_CONFIGURE_OPTS) in the environment
>   - pass the fully-qualified path to autom4te
>   - use of -f even if the package provides its own options
> 
> Some eye-candy in the output of gettextize.
> 
> Thanks to Gustavo for pointing out the discrepancy between the way we
> call gettextize and the way we call autoreconf, and to Thomas for the
> live debug session. ;-)
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
