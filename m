From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:08:55 +0200
Subject: [Buildroot] [PATCH] package/linux-tools: gpio does not build in
 parallel
In-Reply-To: <20170830192541.14873-1-yann.morin.1998@free.fr>
References: <20170830192541.14873-1-yann.morin.1998@free.fr>
Message-ID: <20170830220855.22b2f7eb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Aug 2017 21:25:41 +0200, Yann E. MORIN wrote:
> Partially fixes #10276.
> 
> Reported-by: Ciro Santilli <ciro.santilli@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Ciro Santilli <ciro.santilli@gmail.com>
> ---
>  package/linux-tools/linux-tool-gpio.mk.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
