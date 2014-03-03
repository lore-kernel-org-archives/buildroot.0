From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Mar 2014 21:27:14 +0100
Subject: [Buildroot] [PATCH v2] glibc: needs MMU
In-Reply-To: <1393871487-2739-1-git-send-email-yann.morin.1998@free.fr>
References: <1393871487-2739-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140303212714.21b42ed4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  3 Mar 2014 19:31:27 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Like eglibc, glibc is only available to MMU-based architectures.
> 
> Re-order select/depends to be in-line with eglibc, just above.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> Changes v1 -> v2:
>   - make it really a glibc stuff, not a uClibc one  (Gustavo)
>   - depends/select re-ordering
> ---
>  toolchain/toolchain-buildroot/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
