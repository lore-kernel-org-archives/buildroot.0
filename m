From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:19:08 +0200
Subject: [Buildroot] [PATCH v4 4/9] pkg-generic.mk: don't depend on
 external package permissions
In-Reply-To: <1416586748-12936-5-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-5-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150713171908.75b05534@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 21 Nov 2014 13:19:03 -0300, Guido Mart?nez wrote:
> Reset permissions for rsynced packages (when using OVERRIDE_SRCDIR) to
> 755/644. We do this under the assumption that source files shouldn't
> care about their permissions, except possibly for the exec bit.
> 
> This guarantees that if a package uses 'rsync -a' or 'cp -p' to copy
> a file from its build dir to the target, it'll end up with the same
> permissions on the target every time.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>
> ---
>  package/pkg-generic.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
