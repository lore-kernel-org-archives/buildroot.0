From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Nov 2016 21:40:39 +0100
Subject: [Buildroot] [PATCH v1] postgresql: fix
 pgac_cv_snprintf_long_long_int_modifier
In-Reply-To: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
References: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
Message-ID: <20161128214039.2b3be6a8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 19:53:51 +0100, Peter Seiderer wrote:
> Supplementary change the pgac_cv_snprintf_long_long_int_modifier from
> complete format '%lld' to modifier 'll' version only (forgotten in commit
> 02c43157ab09f6fe4078fd1145fc9d403d66c089 ([1])).
> 
> Fixes Bug 9451 ([2]).
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=02c43157ab09f6fe4078fd1145fc9d403d66c089
> [2] https://bugs.busybox.net/show_bug.cgi?id=9451
> 
> Reported-by: Daniel <dde@innovaphone.com>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/postgresql/postgresql.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
