Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7E5C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3ACE40AEE;
	Mon,  5 Feb 2024 10:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3ACE40AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rH7YwDPXHewC; Mon,  5 Feb 2024 10:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2600940A5D;
	Mon,  5 Feb 2024 10:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2600940A5D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0D61BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:42:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 470DA60F51
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 470DA60F51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZoet7M3nLYL for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:42:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F05860F31
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F05860F31
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCE34FF80D;
 Mon,  5 Feb 2024 10:42:01 +0000 (UTC)
Message-ID: <84311d05-8dd7-4d0b-85d4-2a5a947ef2ee@korsgaard.com>
Date: Mon, 5 Feb 2024 11:42:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <ZbRohvM9uU511czv@waldemar-brodkorb.de>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <ZbRohvM9uU511czv@waldemar-brodkorb.de>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/ruby: bump to 3.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/01/2024 03.20, Waldemar Brodkorb wrote:
> See here for changes:
> https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
> 
> Patch applied upstream.
> 
> License file LEGAL changed.
> [ext/psych/yaml] got removed.
> [lib/bundler/vendor/molinillo] got removed.
> [lib/bundler/vendor/pub_grub] added with MIT License.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
