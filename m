Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD3FECE564
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 07:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96E034026F;
	Tue, 10 Sep 2024 07:08:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o5CYzwJtiRa0; Tue, 10 Sep 2024 07:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C0940214
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C0940214;
	Tue, 10 Sep 2024 07:08:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9441BF2C1
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ABD3405C6
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 07:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BzwTnLFEKafx for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 07:08:37 +0000 (UTC)
X-Greylist: delayed 56440 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Sep 2024 07:08:36 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7D1A40399
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7D1A40399
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7D1A40399
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 07:08:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D28FE40008;
 Tue, 10 Sep 2024 07:08:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1snuzI-00HRwt-10;
 Tue, 10 Sep 2024 09:08:32 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 09:07:40 +0200
Message-Id: <20240910070823.4158894-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 00/42] codespell spelling fixes A-H
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A collection of small typo fixes found by codespell
(https://github.com/codespell-project/codespell/).

I have skipped typo fixes for patches that are direct backports from
upstream.  Patches for the remaining packages will follow later, as the
series is already very long.

Peter Korsgaard (42):
  docs/manual/adding-packages-asciidoc.adoc: fix resources typo in
    example
  docs/manual/adding-packages-linux-kernel-spec-infra.adoc: fix
    information typo
  docs/manual/adding-packages-meson.adoc: fix occurrences typo
  docs/manual/customize-outside-br.adoc: fix 'or' typo
  docs/manual/migrating.adoc: fix occurrence typo
  docs/manual/migrating.adoc: fix accommodate typo
  docs/manual/using-buildroot-toolchain.adoc: fix overridden typo
  docs/website/copyright.txt: fix oboard typo
  docs/website/news.html: fix information typo
  package/alure: fix dependencies typo in comment
  package/audit: fix deactivate typo
  package/avahi: fix appropriate typo
  package/bc: fix typos in patch descriptions
  package/bcache-tools: fix compatibility typo
  package/bcusdk: fix definition typo
  package/boost: fix typos in help text
  package/c-icap-modules: fix Additional typo
  package/chocolate-doom: fix multiple typo
  package/collectd: fix typos in help text / comment
  package/dcron: fix opening typo
  package/dmalloc: fix deactivate typo
  package/dvblast: fix which typo
  package/elftosb: fix typos in patch descriptions
  package/erlang: fix inadvertently typo
  package/exiv2: fix 'information see' typo
  package/falcosecurity-libs: fix which typo
  package/fbgrab: fix framebuffer typo in help text
  package/fcgiwrap: fix explicitly typo
  package/flex: fix typo in patch description
  package/flutter-engine: fix typos in comments
  package/flutter-pi: fix Raspberry typo
  package/gcc: fix explicitly typo
  package/gdb: fix program typo
  package/genpart: fix typos in patch description
  package/gerbera: fix guaranteed typo
  package/go-src: fix variable typo in patch description
  package/go: fix convenience typo
  package/gobject-introspection: fix altogether typo in patch
    description
  package/gtest: fix explanation typo
  package/hddtemp: fix information typo in help text
  package/heirloom-mailx: fix attachments typo in help text
  package/hostapd: fix proprietary typo in help text

 docs/manual/adding-packages-asciidoc.adoc                   | 2 +-
 docs/manual/adding-packages-linux-kernel-spec-infra.adoc    | 2 +-
 docs/manual/adding-packages-meson.adoc                      | 2 +-
 docs/manual/customize-outside-br.adoc                       | 2 +-
 docs/manual/migrating.adoc                                  | 4 ++--
 docs/manual/using-buildroot-toolchain.adoc                  | 2 +-
 docs/website/copyright.txt                                  | 2 +-
 docs/website/news.html                                      | 4 ++--
 package/alure/alure.mk                                      | 2 +-
 package/audit/audit.mk                                      | 2 +-
 package/avahi/0002-remove-imp-from-py-compile.patch         | 4 ++--
 package/bc/0001-bc-use-MAKEINFO-variable-for-docs.patch     | 2 +-
 ...2-notice-read-and-write-errors-on-input-and-output.patch | 2 +-
 package/bc/0004-no-gen-libmath.patch                        | 2 +-
 .../0001-Don-t-inline-crc64-for-gcc-5-compatability.patch   | 4 ++--
 ...eibd-fix-endless-recursion-when-using-USB-backends.patch | 2 +-
 package/boost/Config.in                                     | 4 ++--
 package/c-icap-modules/Config.in                            | 2 +-
 .../0001-Remove-redundant-demoextend-definition.patch       | 2 +-
 package/collectd/Config.in                                  | 6 +++---
 package/collectd/collectd.mk                                | 2 +-
 ...in.c-add-newline-to-logfile-openning-error-message.patch | 2 +-
 package/dmalloc/dmalloc.mk                                  | 2 +-
 package/dvblast/0001-missing-lm.patch                       | 2 +-
 package/elftosb/0001-fixes-includes.patch                   | 2 +-
 package/elftosb/0002-force-cxx-compiler.patch               | 2 +-
 package/erlang/erlang.mk                                    | 2 +-
 package/exiv2/Config.in                                     | 2 +-
 package/falcosecurity-libs/falcosecurity-libs.mk            | 2 +-
 package/fbgrab/Config.in                                    | 2 +-
 package/fcgiwrap/0001-use-LIBS-from-configure.patch         | 2 +-
 package/fcgiwrap/fcgiwrap.mk                                | 2 +-
 ...ild-make-it-possible-to-disable-the-build-of-the-d.patch | 2 +-
 package/flutter-engine/Config.in                            | 2 +-
 package/flutter-engine/gen-tarball                          | 4 ++--
 package/flutter-pi/Config.in                                | 2 +-
 package/gcc/gcc.mk                                          | 2 +-
 package/gdb/Config.in                                       | 2 +-
 package/genpart/0001-fix-return-code.patch                  | 4 ++--
 package/gerbera/gerbera.mk                                  | 2 +-
 ...0001-build.go-explicit-option-for-crosscompilation.patch | 2 +-
 package/go/go.mk                                            | 2 +-
 package/gobject-introspection/0001-disable-tests.patch      | 2 +-
 package/gtest/gtest.mk                                      | 2 +-
 package/hddtemp/Config.in                                   | 2 +-
 package/heirloom-mailx/Config.in                            | 2 +-
 package/hostapd/Config.in                                   | 2 +-
 47 files changed, 56 insertions(+), 56 deletions(-)

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
