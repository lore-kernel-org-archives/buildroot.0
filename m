From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 22:13:44 +0100
Subject: [Buildroot] [PATCH 1/4] binutils: remove blackfin conditionals
In-Reply-To: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150320221344.69cd0649@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 19:44:16 -0300, Gustavo Zacarias wrote:
> Now that we don't support the internal blackfin toolchain any more
> remove unnecessary conditionals.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/binutils/Config.in.host | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

All four patches applied. There were some minor conflicts when applying
the uClibc patch due to another patch that was merged in the mean time,
but I fixed that up while applying (hopefully in the correct way).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
