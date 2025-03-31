Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8F5C3600B
	for <buildroot@archiver.kernel.org>; Mon, 31 Mar 2025 13:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF4A8403E0;
	Mon, 31 Mar 2025 13:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfWsDG5ynCMG; Mon, 31 Mar 2025 13:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 000BE40572
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 000BE40572;
	Mon, 31 Mar 2025 13:38:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E6D121
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B993C404D9
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeBPeiqzVcSj for <buildroot@buildroot.org>;
 Mon, 31 Mar 2025 13:38:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=134.158.66.142;
 helo=cczrelay02.in2p3.fr; envelope-from=david.picard@clermont.in2p3.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D676403E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D676403E0
Received: from cczrelay02.in2p3.fr (cczrelay02.in2p3.fr [134.158.66.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D676403E0
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 13:38:50 +0000 (UTC)
Received: from [172.27.131.23] ([195.221.122.29]) (authenticated bits=0)
 by cczrelay02.in2p3.fr (8.14.4/8.14.4) with ESMTP id 52VDclId011059
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <buildroot@buildroot.org>; Mon, 31 Mar 2025 15:38:47 +0200
Message-ID: <21db9d1f-d552-4f38-bb37-8df27ce1002d@clermont.in2p3.fr>
Date: Mon, 31 Mar 2025 15:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: ML_Buildroot <buildroot@buildroot.org>
From: David Picard <david.picard@clermont.in2p3.fr>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=clermont.in2p3.fr
Subject: [Buildroot] guidelines to select a Wi-Fi/Bluetooth module
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I need to add Wi-Fi and Bluetooth connectivity to my system. But it's 
really hard to understand which driver supports which product.

Could you please me some piece of advice to guide my search for a module ?

David
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
