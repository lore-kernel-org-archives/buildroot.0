From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 May 2016 22:54:43 +0200
Subject: [Buildroot] [PATCH v2 1/6] package/nginx: fix mail modules not
 building
In-Reply-To: <1462268217-31545-1-git-send-email-martin@barkynet.com>
References: <1462268217-31545-1-git-send-email-martin@barkynet.com>
Message-ID: <20160505225443.3cafddf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 May 2016 10:36:52 +0100, Martin Bark wrote:
> Add the missing --with-mail configure option
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>
> 
> ---
> Changes v1 -> v2
>  - new in v2. split from the patch to bump nginx to 1.10.0
>    (suggested by Thomas Petazzoni)
> ---
>  package/nginx/nginx.mk | 1 +
>  1 file changed, 1 insertion(+)

Thanks, I've applied the entire series. On a few patches, I had to
rewrap the Config.in help text so that it fits in 72 characters before
applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
