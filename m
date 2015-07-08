From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jul 2015 10:18:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: remove host-pkgconf
 dependency
In-Reply-To: <1430843074-30355-1-git-send-email-joerg.krause@embedded.rocks>
References: <1430843074-30355-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150708101819.78756fa4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  5 May 2015 18:24:33 +0200, J?rg Krause wrote:
> configure.ac does not contain PKG_CHECK_MODULES anymore.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/libtirpc/libtirpc.mk | 8 --------
>  1 file changed, 8 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
