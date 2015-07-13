From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:20:58 +0200
Subject: [Buildroot] [PATCH v4 6/9] scripts: mkmakefile: set umask
 before calling BR's makefile
In-Reply-To: <1416586748-12936-7-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-7-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150713172058.48fdd71e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:19:05 -0300, Guido Mart?nez wrote:
> Small optimization so we don't have another 'make' level (caused by the
> umask fix) when running the generated makefile.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  support/scripts/mkmakefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
