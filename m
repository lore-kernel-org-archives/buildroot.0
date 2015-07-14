From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Jul 2015 13:05:02 +0200
Subject: [Buildroot] [PATCH] package/openswan: fix parralel build
In-Reply-To: <1436871222-22173-1-git-send-email-yann.morin.1998@free.fr>
References: <1436871222-22173-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20150714130502.1b35ee29@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 14 Jul 2015 12:53:42 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/2ec/2ecb098b01bd44d75182b15f98c1fd2a8c927438/
>     http://autobuild.buildroot.org/results/18f/18f0166f3fa831f321818e286d9c2e9037f8c8d0/
>     ...
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/openswan/openswan.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied after fixing the commit title, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
