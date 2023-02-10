Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9D1C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 15:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59A1F822EA;
	Fri, 10 Feb 2023 15:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59A1F822EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtyW8Hbn1lpA; Fri, 10 Feb 2023 15:30:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DF2822C2;
	Fri, 10 Feb 2023 15:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91DF2822C2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 056C91BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D384360B1B
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D384360B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hmGzZUb_J7RU for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 15:30:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AD4608D8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A2AD4608D8
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:30:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A07A420005;
 Fri, 10 Feb 2023 15:30:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQVMB-00024L-Nq; Fri, 10 Feb 2023 16:30:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
References: <20230210073731.152068-1-fido_max@inbox.ru>
Date: Fri, 10 Feb 2023 16:30:35 +0100
In-Reply-To: <20230210073731.152068-1-fido_max@inbox.ru> (Maxim Kochetkov's
 message of "Fri, 10 Feb 2023 10:37:31 +0300")
Message-ID: <878rh5edwk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gdal: bump version to 3.6.2
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

>>>>> "Maxim" == Maxim Kochetkov <fido_max@inbox.ru> writes:

 > Release notes: https://github.com/OSGeo/gdal/blob/v3.6.2/NEWS.md
 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
 > ---
 >  package/gdal/gdal.hash | 6 +++---
 >  package/gdal/gdal.mk   | 2 +-
 >  2 files changed, 4 insertions(+), 4 deletions(-)

 > diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
 > index ab77d7840d..6cf3336644 100644
 > --- a/package/gdal/gdal.hash
 > +++ b/package/gdal/gdal.hash
 > @@ -1,6 +1,6 @@
 > -# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
 > -md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
 > -sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
 > +# md5 from: https://download.osgeo.org/gdal/3.6.2/gdal-3.6.2.tar.gz.md5, sha256 locally computed:
 > +md5  6f22ffdbd8e00059ddb2b825c5920c4c  gdal-3.6.2.tar.xz
 > +sha256  35f40d2e08061b342513cdcddc2b997b3814ef8254514f0ef1e8bc7aa56cf681  gdal-3.6.2.tar.xz
 
 >  # Hashes of license files:
 >  sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
 > diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
 > index a3b11c53af..ba9ba71b3b 100644
 > --- a/package/gdal/gdal.mk
 > +++ b/package/gdal/gdal.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -GDAL_VERSION = 3.5.2
 > +GDAL_VERSION = 3.6.2

Looks like the license details changed:

>>> gdal 3.6.2 Collecting legal info
ERROR: LICENSE.TXT has wrong sha256 hash:
ERROR: expected: fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a
ERROR: got     : 1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Please review the changes, update the commit message to explain this and
update hash (and GDAL_LICENSE if needed), thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
