From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Apr 2014 21:49:05 +0200
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.4
In-Reply-To: <1397759132-9068-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1397759132-9068-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <20140417214905.63523b22@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jerzy Grzegorek,

On Thu, 17 Apr 2014 20:25:32 +0200, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
> ---
>  package/zeromq/zeromq.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied. However, since you're bumping zeromq, I assume you're
using it. If that's the case, then it would be nice if you could help
fixing the zeromq build failures that are affecting the autobuilders
currently. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
