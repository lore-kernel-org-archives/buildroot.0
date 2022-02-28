Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216AFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 18:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC10B41061;
	Mon, 28 Feb 2022 18:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3qb9LYYJ9IxA; Mon, 28 Feb 2022 18:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02DBA409D4;
	Mon, 28 Feb 2022 18:51:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBD551BF2CE
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B848760E3E
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 18:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxtDO83Y82Hu for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 18:51:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF33660AF6
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:51:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D58421C0005
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 18:51:25 +0000 (UTC)
Message-ID: <b8b9f7d9-1648-a7ca-ed64-42f7d0850d70@korsgaard.com>
Date: Mon, 28 Feb 2022 19:51:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220213202407.1205912-1-fontaine.fabrice@gmail.com>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20220213202407.1205912-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: security bump to
 version 10.3.34
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

Hi,

On 13/02/2022 21.24, Fabrice Fontaine wrote:
> Fix CVE-2021-46665, CVE-2021-46664, CVE-2021-46661, CVE-2021-46668,
> CVE-2021-46663, CVE-2022-24052, CVE-2022-24051, CVE-2022-24050,
> CVE-2022-24048, CVE-2021-46659, CVE-2021-35604, CVE-2021-46667,
> CVE-2021-46662, CVE-2021-2372, CVE-2021-2389 and CVE-2021-46658
> 
> Update hash of README.md (changes not related to license:
> https://github.com/MariaDB/server/commit/773a07b65517327add6348c045cee14bdf489fe0)
> 
> https://mariadb.com/kb/en/mariadb-10334-release-notes/
> https://mariadb.com/kb/en/mariadb-10333-release-notes/
> https://mariadb.com/kb/en/mariadb-10332-release-notes/
> https://mariadb.com/kb/en/mariadb-10331-release-notes/
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

--
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
