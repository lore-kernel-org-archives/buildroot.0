From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 21:09:35 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/linuxptp: fix coding style
 issue
In-Reply-To: <20170706174336.12294-1-romain.naour@smile.fr>
References: <20170706174336.12294-1-romain.naour@smile.fr>
Message-ID: <20170706210935.4204fd61@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Jul 2017 19:43:35 +0200, Romain Naour wrote:
> Thanks to Yann for the live review during the Buildroot summer camp.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Petr Kulhavy <brain@jikos.cz>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/linuxptp/linuxptp.mk | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

I've applied both patches. However, the second patch created quite a
bit of duplication between the build and install steps, so I committed
an additional patch that creates and uses LINUXPTP_MAKE_ENV and
LINUXPTP_MAKE_OPTS variables.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
