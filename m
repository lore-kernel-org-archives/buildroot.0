From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Jun 2015 03:15:37 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-final: install libatomic via
 HOST_GCC_FINAL_GCC_LIB_DIR
In-Reply-To: <1433464127-10834-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433464127-10834-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150606031537.4c4565a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  4 Jun 2015 21:28:47 -0300, Gustavo Zacarias wrote:
> Otherwise it's a no-op for sh4.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
