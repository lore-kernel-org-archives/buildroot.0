From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:12:05 +0100
Subject: [Buildroot] [PATCH] Revert "package/gcc: fix libgcc build for
 xtensa"
In-Reply-To: <1457660040-13917-1-git-send-email-jcmvbkbc@gmail.com>
References: <1457660040-13917-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160320221205.17eed6c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Mar 2016 04:34:00 +0300, Max Filippov wrote:
> This reverts commit c44cf2cc97df1729577263d2b0cb5263e8cdc4c1.
> Now that xtensa gas don't move literals into .init and .fini this fix is
> no longer needed.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/gcc/gcc.mk | 7 -------
>  1 file changed, 7 deletions(-)

I've added a few more details in the commit, as suggested by Yann, and
using the info you provided as a reply to Yann. Then I applied, of
course.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
