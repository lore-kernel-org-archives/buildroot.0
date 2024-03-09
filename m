Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02898C54798
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 13:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE835814B5;
	Sat,  9 Mar 2024 13:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ias6hqwvR_fx; Sat,  9 Mar 2024 13:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D81698200F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D81698200F;
	Sat,  9 Mar 2024 13:37:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 966111BF300
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8282F60744
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:37:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3K321n_MxtBb for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 13:37:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 60E776065C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E776065C
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 60E776065C
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 13:37:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 672171BF203;
 Sat,  9 Mar 2024 13:37:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1riwt5-005PIt-2Z;
 Sat, 09 Mar 2024 14:37:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <cover.1707600292.git.yann.morin.1998@free.fr>
 <62cf7f8a3ab7e42c2354cfa3881477d35ae5890d.1707600292.git.yann.morin.1998@free.fr>
Date: Sat, 09 Mar 2024 14:37:19 +0100
In-Reply-To: <62cf7f8a3ab7e42c2354cfa3881477d35ae5890d.1707600292.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 10 Feb 2024 22:24:55 +0100")
Message-ID: <87zfv7ttkg.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 2/6 v2] doc/manual: fixup ordered lists
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > With recent asiidoc versions (at least 10.2.0 is known to report that),
 > rendering the manual yields a few warnings related to ordered lists:

 >     asciidoc: WARNING: customize-quick-guide.adoc: line 13: list item index: expected 2 got 1
 >     asciidoc: WARNING: customize-quick-guide.adoc: line 15: list item index: expected 3 got 1
 >     [...]
 >     asciidoc: WARNING: customize-quick-guide.adoc: line 65: list item index: expected 13 got 1
 >     asciidoc: WARNING: customize-quick-guide.adoc: line 66: list item index: expected 14 got 1
 >     asciidoc: WARNING: adding-packages-gettext.adoc: line 30: list item index: expected 2 got 1
 >     asciidoc: WARNING: adding-packages-gettext.adoc: line 41: list item index: expected 3 got 1

 > The reason is that we use the same index to tell asciidoc to
 > automatically number items.

 > However, the official way to provide an automatic index is to write no
 > index:

 >     https://docs.asciidoctor.org/asciidoc/latest/lists/ordered/

 >     [...] since the numbering is obvious, the AsciiDoc processor will
 >     insert the numbers for you if you omit them:
 >     [...]
 >     If you number the ordered list explicitly, you have to manually keep
 >     the list numerals sequential. Otherwise, you will get a warning.

 > So, abide by the documentation, and drop the repeating indices to
 > ordered lists where we want automatic numbering.

 > Note that there is another ordered list, in adding-packages-directory.adoc,
 > but it does use explicit, sequential numbering. For consistency within
 > the whole document, we also convert it.

 > To avoid extra useless churn, the indentation of the items is not
 > changed to match the elided indices.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
