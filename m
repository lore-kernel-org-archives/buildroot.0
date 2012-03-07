From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Wed, 7 Mar 2012 11:39:12 +0100
Subject: [Buildroot] [git commit] barebox: add 2012.03 release
In-Reply-To: <20120306215605.34C7E90D15@busybox.osuosl.org>
References: <20120306215605.34C7E90D15@busybox.osuosl.org>
Message-ID: <20120307113912.626ff962@eb-e6520>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le Tue, 6 Mar 2012 22:55:30 +0100,
Peter Korsgaard <jacmet@sunsite.dk> a ?crit :
> +config BR2_TARGET_BAREBOX_2012_03
> +	bool "2012.03"
> +
>  config BR2_TARGET_BAREBOX_CUSTOM_TARBALL
>  	bool "Custom tarball"
>  
> @@ -42,6 +45,7 @@ config BR2_TARGET_BAREBOX_VERSION
>  	default "2011.12.0"	if BR2_TARGET_BAREBOX_2011_12
>  	default "2012.01.0"	if BR2_TARGET_BAREBOX_2012_01
>  	default "2012.02.0"	if BR2_TARGET_BAREBOX_2012_02
> +	default "2012.03.0"	if BR2_TARGET_BAREBOX_2012_02
missing change here :                                      ^^

Eric
-- 
http://eukrea.com/en/news/104-2012
