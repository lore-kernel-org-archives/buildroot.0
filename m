From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 3 Mar 2011 19:22:20 +0100
Subject: [Buildroot] [PATCH v2 1/2] Makefile: improve $(TARGET_DIR)
	(re)creation
In-Reply-To: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
References: <1297986294-23446-1-git-send-email-bjorn.forsman@gmail.com>
Message-ID: <AANLkTimMuVe44_cmN-OwvuA=6M-+H2VHOAfbV_XNfg79@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/2/18 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> This patch fixes the following use case:
>
> ?1. Build, hack, ...
> ?2. Oh no, $(TARGET_DIR) is no longer in sync with $(TARGET_SKELETON)
> ? ?and/or the packages selected in menuconfig. If only there was a way
> ? ?to *easily* rebuild $(TARGET_DIR) so it is in sync...

There is a bug in this patch: Qt isn't completely reinstalled (libs
are, but not demos/examples). I will send an updated patch shortly.

Best regards,
Bj?rn Forsman
