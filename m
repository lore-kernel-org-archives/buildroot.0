Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1B6EEB56E
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC106416AF;
	Fri,  8 Sep 2023 20:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC106416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCoK9MUwvEgg; Fri,  8 Sep 2023 20:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C707C415FD;
	Fri,  8 Sep 2023 20:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C707C415FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 687741BF2BA
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4179681F6F
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 20:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4179681F6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqV1eyTBCsPj for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB6E81F62
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB6E81F62
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A1B886B48; Fri,  8 Sep 2023 20:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 8 Sep 2023 22:46:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b25f1cb47c55dab9de706d61809936839cfe8f5f
X-Git-Newrev: 177170f42fa882d60f89e2f5402a14e416fb67de
X-Patchwork-Hint: ignore
Message-Id: <20230908204624.4A1B886B48@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add myself as developer for
 all python packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=177170f42fa882d60f89e2f5402a14e416fb67de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS | 71 +-------------------------------------------------------------
 1 file changed, 1 insertion(+), 70 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 6daf4657dd..648058fcbe 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1403,76 +1403,7 @@ F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
 F:	package/pipewire/
-F:	package/python-aioconsole/
-F:	package/python-aiodns/
-F:	package/python-aiohttp/
-F:	package/python-aiohttp-cors/
-F:	package/python-aiohttp-debugtoolbar/
-F:	package/python-aiohttp-jinja2/
-F:	package/python-aiohttp-mako/
-F:	package/python-aiohttp-remotes/
-F:	package/python-aiohttp-security/
-F:	package/python-aiohttp-session/
-F:	package/python-aiohttp-sse/
-F:	package/python-aiologstash/
-F:	package/python-aiomonitor/
-F:	package/python-aiojobs/
-F:	package/python-aioprocessing/
-F:	package/python-aiorwlock/
-F:	package/python-aiosignal/
-F:	package/python-aiozipkin/
-F:	package/python-argon2-cffi/
-F:	package/python-argon2-cffi-bindings/
-F:	package/python-async-generator/
-F:	package/python-async-lru/
-F:	package/python-async-timeout/
-F:	package/python-bidict/
-F:	package/python-brotli/
-F:	package/python-cbor2/
-F:	package/python-cchardet/
-F:	package/python-charset-normalizer/
-F:	package/python-cssselect2/
-F:	package/python-distlib/
-F:	package/python-editables/
-F:	package/python-flatbuffers/
-F:	package/python-fonttools/
-F:	package/python-frozenlist/
-F:	package/python-greenlet/
-F:	package/python-h11/
-F:	package/python-hatchling/
-F:	package/python-hatch-fancy-pypi-readme/
-F:	package/python-hatch-vcs/
-F:	package/python-installer/
-F:	package/python-janus/
-F:	package/python-logstash/
-F:	package/python-maturin/
-F:	package/python-multidict/
-F:	package/python-mypy-extensions/
-F:	package/python-outcome/
-F:	package/python-pathspec/
-F:	package/python-pycares/
-F:	package/python-pydyf/
-F:	package/python-pypa-build/
-F:	package/python-pyphen/
-F:	package/python-pyproject-hooks/
-F:	package/python-rpds-py/
-F:	package/python-rtoml/
-F:	package/python-selenium/
-F:	package/python-snappy/
-F:	package/python-sniffio/
-F:	package/python-sockjs/
-F:	package/python-terminaltables/
-F:	package/python-tinycss2/
-F:	package/python-tomli/
-F:	package/python-trio/
-F:	package/python-trio-websocket/
-F:	package/python-typeguard/
-F:	package/python-typing-inspect/
-F:	package/python-uhid/
-F:	package/python-weasyprint/
-F:	package/python-wsproto/
-F:	package/python-yarl/
-F:	package/python-zopfli/
+F:	package/python*
 F:	package/rtl8192eu/
 F:	package/serd/
 F:	package/sord/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
