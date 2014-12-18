From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 18 Dec 2014 06:54:42 +0100
Subject: [Buildroot] [buildroot-test 2/2] Enable paranoid path checking
References: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1418852858-818-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <XnsA407464BCEF2CberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:1418852858-818-2-git-send-email-
thomas.petazzoni at free-electrons.com:

> Do we want to apply this right now? We already have a lot of failures
> caused by the static/shared change. Do we want to have more?
[...]
> +    configlines.append("BR2_COMPILER_PARANOID_UNSAFE_PATH=y\n")

Hi,

I vote for yes.

Regards, Bernd
