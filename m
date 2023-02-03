Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2757C636CC
	for <buildroot@archiver.kernel.org>; Fri,  3 Feb 2023 07:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3593341E89;
	Fri,  3 Feb 2023 07:29:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3593341E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETSBZ_zInlYM; Fri,  3 Feb 2023 07:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3916841D55;
	Fri,  3 Feb 2023 07:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3916841D55
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 80D641BF3A8
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6812A41D55
 for <buildroot@lists.busybox.net>; Fri,  3 Feb 2023 07:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6812A41D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eoSE8CbzGAYf for <buildroot@lists.busybox.net>;
 Fri,  3 Feb 2023 07:29:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C47DF41D46
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C47DF41D46
 for <buildroot@buildroot.org>; Fri,  3 Feb 2023 07:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id 3DD7F1814B9; Fri,  3 Feb 2023 08:29:34 +0100 (CET)
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
User-Agent: SOGoMail 5.8.0
MIME-Version: 1.0
Date: Fri, 03 Feb 2023 08:29:33 +0100
Message-ID: <66d07-63dcb800-3-60a2a380@15361192>
X-Last-TLS-Session-Version: None
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1675409374; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=058Zv7OW59TyO82mRrhFAPcahiNF41qDCMlfbrERceE=;
 b=JaDQ/u+mFzDzK+6ybjTLq1JpDXNZ52jIhK/cS3JYyDaiLJgEAt6Le/KDLVoQWNxnpTrg/U
 rXq94yn24PBCoHXk1JyL2XHoUilBJQTgkEz1/qK2Y+qiHOyn2IGXC+IUnJ1DZBUUWMgw2G
 RPOBNWXQOwaiHVIQTy/cBfu++V8Ttag=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=JaDQ/u+m
Subject: Re: [Buildroot] 
 =?utf-8?b?Pz09P3V0Zi04P3E/IFthdXRvYnVpbGQuYnVpbGRy?=
 =?utf-8?q?oot=2Enet=5D_Your_daily_results_for_2023-02-02?=
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Friday, February 03, 2023 07:45 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello,
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arc      |          boost-1.80.0          | http://autobuild.buildroot.net/results/64d963395cf0383003e68c3c5f4f4a587f0d6c46
> 
I submitted a patch for this a while back. I think it got lost. Care to take a look?
https://patchwork.ozlabs.org/project/buildroot/patch/20221223133401.97844-1-buildroot@heine.tech/

Regards,
Michael

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
