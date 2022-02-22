Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3282C433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 10:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68C0C819FC;
	Tue, 22 Feb 2022 10:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlIgKhwsGx9y; Tue, 22 Feb 2022 10:37:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CC4381A46;
	Tue, 22 Feb 2022 10:37:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D7081BF280
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AE2A40137
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 10:37:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXH_-VSZQ2Y6 for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 10:37:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2F99405A0
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 10:36:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE806240038;
 Tue, 22 Feb 2022 10:36:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMSX0-0060oM-W6; Tue, 22 Feb 2022 11:36:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220221233745.520318-1-aperez@igalia.com>
Date: Tue, 22 Feb 2022 11:36:30 +0100
In-Reply-To: <20220221233745.520318-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Tue, 22 Feb 2022 01:37:45 +0200")
Message-ID: <87pmnf6vdd.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: bump to version
 0.1.3
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > This is a minor maintenance release. The release incorporates
 > "0001-Fix-musl-compilation-by-adding-TEMP_FAILURE_RETRY.patch", which
 > can now be removed.

 > Release notes:

 >   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to master given the small amount of changes, thanks.

 > +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
 > @@ -1,5 +1,5 @@
 > -# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.2
 > -sha256 1749d6f9f46dcc9edc87725641cf56cf91dcad1b01707891ea0850c1000c520f xdg-dbus-proxy-0.1.2.tar.xz
 > +# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.3
 > +sha256 03b5d28ca879253ddbbce31098909becca1495ea811a6377a492e28f16c09b9b xdg-dbus-proxy-0.1.3.tar.xz

The "new" agreement is two spaces - And check-package complains about,
so I've fixed that while applying.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
