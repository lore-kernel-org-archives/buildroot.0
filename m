From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Tue, 9 Apr 2019 19:40:05 +0000
Subject: [Buildroot] [PATCH 1/2] package/gettext-tiny: Fix cyclic
 dependency with iconv
In-Reply-To: <1554818104-7594-1-git-send-email-email@gmail.com>
References: <1554818104-7594-1-git-send-email-email@gmail.com>
Message-ID: <CY4PR1201MB01206B53B679013118403585A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vadim,

> -----Original Message-----
> From: Vadim Kochan <vadim4j@gmail.com>
> Sent: Tuesday, April 9, 2019 4:55 PM
> To: buildroot at buildroot.org
> Cc: Vadim Kochan <vadim4j@gmail.com>; Alexey Brodkin <alexey.brodkin@synopsys.com>
> Subject: [PATCH 1/2] package/gettext-tiny: Fix cyclic dependency with iconv
> 
> From: Vadim Kochan <vadim4j@gmail.com>
> 
> target's libiconv is added into host dependency which makes cyclic
> dependency, anyway this dependency is not needed because of assumption
> that iconv should be provided by the host.
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---

Thanks for fixing this one!

Reviewed-by: Alexey Brodkin <abrokdin@synopsys.com>
