From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Jul 2014 23:39:44 +0200
Subject: [Buildroot] [PATCH] system/skeleton: remove spurious group
 'nobody'
In-Reply-To: <1405981031-27565-1-git-send-email-yann.morin.1998@free.fr>
References: <1405981031-27565-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20140723233944.3494fcfc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 22 Jul 2014 00:17:11 +0200, Yann E. MORIN wrote:
> We defien the two groups 'nobody' and 'nogroup' in our skeleton, but

defien -> define

> they have the same gid, which is not valid.
> 
> This breaks the mkuser script, as noticed by Thomas.
> 
> Anyway, the user 'nobody' belongs to the group 'nogroup' in any sane
> distribution.
> 
> So, just remove the spurious 'nobody' group.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  system/skeleton/etc/group | 1 -
>  1 file changed, 1 deletion(-)

Applied with the minor fix above, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
