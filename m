From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Jul 2014 15:08:03 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: enhance doc for
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y
In-Reply-To: <f8aa686b6618867afc2725a276beb75a63e8ca12.1406323367.git.yann.morin.1998@free.fr>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
 <f8aa686b6618867afc2725a276beb75a63e8ca12.1406323367.git.yann.morin.1998@free.fr>
Message-ID: <20140727150803.31a8803f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 25 Jul 2014 23:28:14 +0200, Yann E. MORIN wrote:
> The BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y symbols can be used to denote the
> lowest required kernel headers version, but also the highest supported
> version. Document that.
> 
> Use the `...` construct instead of +...+ used eveywhere else, otherwise
> asciidoc would render +<=+ to the ? arrow, while `...` does no rendering
> at all.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  docs/manual/adding-packages-directory.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
