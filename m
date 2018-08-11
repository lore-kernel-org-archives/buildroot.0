From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 10 Aug 2018 21:44:06 -0300
Subject: [Buildroot] [PATCH] Makefile: introduce check-package target
References: <20180810215153.22987-1-thomas.petazzoni@bootlin.com>
Message-ID: <5b6e3156b5655_76cc3fa63a043e8413526@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Very handy make target!

On Fri, Aug 10, 2018 at 06:51 PM, Thomas Petazzoni wrote:

[snip]
> ---
>  .gitlab-ci.yml | 3 +--
>  Makefile       | 4 ++++
>  2 files changed, 5 insertions(+), 2 deletions(-)

You forgot to change .gitlab-ci.yml.in

[snip]
> +++ b/Makefile
> @@ -1125,6 +1125,10 @@ release:
>  print-version:
>  	@echo $(BR2_VERSION_FULL)
>  
> +check-package:

Shouldn't it be added to noconfig_targets?


Regards,
Ricardo
