From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 15:55:01 +0100
Subject: [Buildroot] [PATCH v2] package/nftables: do not build docs
In-Reply-To: <1419691820-4044-1-git-send-email-yann.morin.1998@free.fr>
References: <1419691820-4044-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141227155501.1b99135c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 27 Dec 2014 15:50:20 +0100, Yann E. MORIN wrote:
> Building docs requires dblatex with a working Jade Wrapper (jw) which
> may well be missing on the build machine, and we do not build our own.
> 
> Since docs are anyway removed from the target, just do not build them.
> 
> Tell ./configure that we do not have the required tools:
>   - DBLATEX=no to disable PDF generation
>   - DOCBOOK2X_MAN=no, DOCBOOK2MAN=no and DB2X_DOCBOOK2MAN=no to disable
>     manpage generation
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
