From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 19:47:25 +0100
Subject: [Buildroot] [PATCH v4 5/9] package: matchbox-keyboard: use
 install instead of cp
In-Reply-To: <1416586748-12936-6-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-6-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141122194725.3263241a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:19:04 -0300, Guido Mart?nez wrote:
> in order to not depend on the previous permissions of the file
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/matchbox/matchbox-keyboard/matchbox-keyboard.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied to the next branch, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
