From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 23:19:05 +0100
Subject: [Buildroot] [PATCH 27/51] sconeserver: bump version
In-Reply-To: <1414349157-22749-27-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-27-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141101231905.499ce012@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:33 +0100, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/sconeserver/sconeserver.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
> index 6b91469..fd2123d 100644
> --- a/package/sconeserver/sconeserver.mk
> +++ b/package/sconeserver/sconeserver.mk
> @@ -6,7 +6,7 @@
>  
>  # Release 0.6.0 doesn't build cleanly, so use a recent
>  # Git commit.
> -SCONESERVER_VERSION = d58f2de88c681939554089f786e360042a30c8f8
> +SCONESERVER_VERSION = 3b886c3dda6eda39bcb27472d29ed7fd3185ba1d
>  SCONESERVER_SITE = $(call github,sconemad,sconeserver,$(SCONESERVER_VERSION))
>  SCONESERVER_LICENSE = GPLv2+
>  SCONESERVER_LICENSE_FILES = COPYING

When something is bumped from a random commit to another random commit,
it would be good to have a commit log that explains the motivation for
the bump.

I've nonetheless applied the patch, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
