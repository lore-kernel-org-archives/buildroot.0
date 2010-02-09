From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 09 Feb 2010 16:38:20 +0100
Subject: [Buildroot] [PATCH] get_linux_config.sh: sets THIS_MINOR to 0
	by default when processing a
In-Reply-To: <1265726755-15417-1-git-send-email-julien.boibessot@free.fr>
	(julien boibessot's message of "Tue, 9 Feb 2010 15:45:55 +0100")
References: <1265726755-15417-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87zl3is9lf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

Commit text truncated?

A more detailed commit message would be good.

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
 julien> ---
 julien>  scripts/get_linux_config.sh |    1 +
 julien>  1 files changed, 1 insertions(+), 0 deletions(-)

 julien> diff --git a/scripts/get_linux_config.sh b/scripts/get_linux_config.sh
 julien> index 1950e9d..5cd0e37 100755
 julien> --- a/scripts/get_linux_config.sh
 julien> +++ b/scripts/get_linux_config.sh
 julien> @@ -35,6 +35,7 @@ function linux_version()
 julien>  	KERNEL=`echo ${KCONFIG} | sed s/.*linux-2.6./linux-2.6./g -`
 julien>  	THIS_MAJOR=${KERNEL:10:2}
 julien>  	THIS_MINOR=${KERNEL:13}
 julien> +	THIS_MINOR=${THIS_MINOR:=0}
 julien>  }
 
 julien>  # Try to be careful...
 julien> -- 
 julien> 1.6.0.4

 julien> _______________________________________________
 julien> buildroot mailing list
 julien> buildroot at busybox.net
 julien> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
