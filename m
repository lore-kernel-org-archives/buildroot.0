Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B69AC47088
	for <buildroot@archiver.kernel.org>; Fri,  2 Dec 2022 13:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC8678217D;
	Fri,  2 Dec 2022 13:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8678217D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecPPXwRC_2k8; Fri,  2 Dec 2022 13:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A022E82185;
	Fri,  2 Dec 2022 13:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A022E82185
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9F51BF293
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 13:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ECF641BB9
 for <buildroot@lists.busybox.net>; Fri,  2 Dec 2022 13:17:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ECF641BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GimThs5vIsCD for <buildroot@lists.busybox.net>;
 Fri,  2 Dec 2022 13:17:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D311A41BA8
Received: from 002.mia.mailroute.net (002.mia.mailroute.net [199.89.3.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D311A41BA8
 for <buildroot@buildroot.org>; Fri,  2 Dec 2022 13:17:21 +0000 (UTC)
Received: from localhost (002.mia.mailroute.net [127.0.0.1])
 by 002.mia.mailroute.net (Postfix) with ESMTP id 4NNtlN2LpXz25hVw;
 Fri,  2 Dec 2022 13:17:20 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 002.mia.mailroute.net ([199.89.3.5])
 by localhost (002.mia [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id q46JXtMQvo03; Fri,  2 Dec 2022 13:17:12 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 002.mia.mailroute.net (Postfix) with ESMTPS id 4NNtl56jTfz25hk4;
 Fri,  2 Dec 2022 13:17:04 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Fri, 2 Dec 2022 08:17:03 -0500
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Fri, 2 Dec 2022 08:17:03 -0500
To: "zhaozikui@eswincomputing.com" <zhaozikui@eswincomputing.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/1] docs/manual: fixed some spelling
 mistakes
Thread-Index: AQHZBgENklpZW26+WEaLnsGF4J6D565a6IuA
Date: Fri, 2 Dec 2022 13:17:03 +0000
Message-ID: <a5a4a0880c831ba7793a960cce9172363f144703.camel@carnegierobotics.com>
References: <20221202034841.1172-1-zhaozikui@eswincomputing.com>
 <20221202034841.1172-2-zhaozikui@eswincomputing.com>
In-Reply-To: <20221202034841.1172-2-zhaozikui@eswincomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [67.20.243.134]
Content-ID: <999C5FF17B28994F900CA379DA711209@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1669987032; x=1672579033;
 bh=2sdc8t1x852cDA0divwrtcDpgk9zZCZ75xcVtjV4wjg=; b=3J/XPH7/Mj7Q
 qqXWmNtFey21FWRjUKG7Wu0plx31CMcCcyYZXtft8Tw6vFhuwEU2wGLRTlKqLTmU
 81Va72nwQ5JqiGH7GpOlCotdiKnjsAiu38XD39YA0uII0tHTrWjU1u3Vfut5UnfB
 FlR3HtcZgnp3kBeNf5p/dv4TTM+JwyzxXbFN9Sdl5OEc1mY6LgPY5iXfBhw2f3NG
 eTJ85u4s0kjuv2MoAR20Kt4zolIdAfLVeBT3jvdjYjjxZMeEqwQh37ANiOAXO0Ix
 Ldh+nvqfvFS3MDs5zKP7XSTEoYBNtobZ9A6jenUsF/5kzf5URzxyEMG5mZW5cqPK
 B0quCkWVvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=3J/XPH7/
Subject: Re: [Buildroot] [PATCH v2 1/1] docs/manual: fixed some spelling
 mistakes
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: "jinyanjiang@eswincomputing.com" <jinyanjiang@eswincomputing.com>,
 "zhuwenjun@eswincomputing.com" <zhuwenjun@eswincomputing.com>,
 "zhengyu@eswincomputing.com" <zhengyu@eswincomputing.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>,
 "zhangdongdong@eswincomputing.com" <zhangdongdong@eswincomputing.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Woodrow Douglass <wdouglass@carnegierobotics.com>

On Fri, 2022-12-02 at 11:48 +0800, Zikui Zhao wrote:
> Fixed some spelling mistakes of countable nouns.
> 
> Signed-off-by: Zikui Zhao <zhaozikui@eswincomputing.com>
> Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  docs/manual/customize-directory-structure.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/manual/customize-directory-structure.txt b/docs/manual/customize-directory-structure.txt
> index a3a7ad4cb9..1249421da2 100644
> --- a/docs/manual/customize-directory-structure.txt
> +++ b/docs/manual/customize-directory-structure.txt
> @@ -27,10 +27,10 @@ to you.
>  |           +-- post_image.sh
>  |           +-- rootfs_overlay/
>  |           |   +-- etc/
> -|           |   +-- <some file>
> +|           |   +-- <some files>
>  |           +-- patches/
>  |               +-- foo/
> -|               |   +-- <some patch>
> +|               |   +-- <some patches>
>  |               +-- libbar/
>  |                   +-- <some other patches>
>  |
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
