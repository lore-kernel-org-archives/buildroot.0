From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 23:34:09 +0200
Subject: [Buildroot] [PATCH 1/2] package/icu: icu-uc: provide -lstdc++
 flag for static build
In-Reply-To: <1437601623-3001-1-git-send-email-romain.naour@openwide.fr>
References: <1437601623-3001-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150723233409.4586c3c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 22 Jul 2015 23:47:02 +0200, Romain Naour wrote:
> icu-uc.pc must provide -lstdc++ for C application linked
> statically with libicuuc.a.
> 
> Related to:
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef521ca/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  .../icu/0005-fix-static-linking-with-icu-uc.patch  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/icu/0005-fix-static-linking-with-icu-uc.patch

Applied, thanks. Please submit the patch upstream!

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
