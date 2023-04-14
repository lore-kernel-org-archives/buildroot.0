Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630F3C77B70
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 08:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E321B42002;
	Fri, 14 Apr 2023 08:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E321B42002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EE5OGyIaUM6V; Fri, 14 Apr 2023 08:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBABE427C6;
	Fri, 14 Apr 2023 08:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBABE427C6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C26A1BF356
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 08:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E9BD84299
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 08:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9BD84299
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBfv6wimqohl for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 08:27:25 +0000 (UTC)
X-Greylist: delayed 00:08:32 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F53884297
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F53884297
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 08:27:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (11)
Received: from [192.168.65.245] (95.143.241.142.ultranet.net.pl
 [95.143.241.142])
 by server220076.nazwa.pl (Postfix) with ESMTP id 702861BC98F;
 Fri, 14 Apr 2023 10:18:50 +0200 (CEST)
Message-ID: <54b688cd-5b7f-767f-6fd8-d55393075e21@grinn-global.com>
Date: Fri, 14 Apr 2023 10:18:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Witold Lipieta <witold.lipieta@thaumatec.com>, buildroot@buildroot.org
References: <20230413113416.3445526-1-witold.lipieta@thaumatec.com>
From: =?UTF-8?Q?Bartosz_Bi=c5=82as?= <b.bilas@grinn-global.com>
In-Reply-To: <20230413113416.3445526-1-witold.lipieta@thaumatec.com>
Subject: Re: [Buildroot] [PATCH 1/1] package: python-esptool: Bump version
 to 4.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Acked-by: Bartosz Bilas <b.bilas@grinn-global.com>

On 4/13/23 13:34, Witold Lipieta wrote:
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
> ---
>   package/python-esptool/python-esptool.hash | 4 ++--
>   package/python-esptool/python-esptool.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-esptool/python-esptool.hash b/package/python-esptool/python-esptool.hash
> index b7246f9788..e1d3188658 100644
> --- a/package/python-esptool/python-esptool.hash
> +++ b/package/python-esptool/python-esptool.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/esptool/json
> -md5  92c38551bc33bd5271bdea033aa51610  esptool-4.4.tar.gz
> -sha256  8acd4dfe70819b1302861ae92894380fb4700b377f5a4739479a4ec276e0b256  esptool-4.4.tar.gz
> +md5  fbad6fb6024580fd2645331f92a74555  esptool-4.5.1.tar.gz
> +sha256  e3eb59836123e5ebf793ef639311f7d85645526487d8b1c2b51159b455106b9a  esptool-4.5.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/python-esptool/python-esptool.mk b/package/python-esptool/python-esptool.mk
> index 0a71e1a78b..34bdf6cc96 100644
> --- a/package/python-esptool/python-esptool.mk
> +++ b/package/python-esptool/python-esptool.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_ESPTOOL_VERSION = 4.4
> +PYTHON_ESPTOOL_VERSION = 4.5.1
>   PYTHON_ESPTOOL_SOURCE = esptool-$(PYTHON_ESPTOOL_VERSION).tar.gz
> -PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/8b/4c/82d7fe5fa0643415bbb90bebff1f861816903c481ee5156fabd6d76dc684
> +PYTHON_ESPTOOL_SITE = https://files.pythonhosted.org/packages/04/80/8eb97d1793cfaf830a4c0a7ea1d8f0674ccba8c23b7d02dcce074b5f44ea
>   PYTHON_ESPTOOL_SETUP_TYPE = setuptools
>   PYTHON_ESPTOOL_LICENSE = GPL-2.0+
>   PYTHON_ESPTOOL_LICENSE_FILES = LICENSE
-- 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
