From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Oct 2014 19:27:46 +0200
Subject: [Buildroot] [PATCH] package: libarchive: allow building as host
 package
In-Reply-To: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1411773795-7803-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141011192746.009064c8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 26 Sep 2014 20:23:15 -0300, Guido Mart?nez wrote:
> It works correctly without any changes, so just enable it.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/libarchive/libarchive.mk | 1 +
>  1 file changed, 1 insertion(+)

As was explained during the review, since there is no in-tree user for
this host package, we rejected the patch. If another package needs it
some day, then of course we'll accept such a patch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
