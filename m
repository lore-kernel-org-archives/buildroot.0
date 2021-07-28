Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F129C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:54:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF11260F01
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DF11260F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B91C460AF5;
	Wed,  4 Aug 2021 00:54:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OzN9VWLkN1BO; Wed,  4 Aug 2021 00:54:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C2460B22;
	Wed,  4 Aug 2021 00:54:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA7821BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D8440F11
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyafPRn-Jh3j for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0704040FA1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5B94787E2D; Tue,  3 Aug 2021 21:10:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Jul 2021 21:34:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3ef0723cf7159401de595dbfb2d023d78c9336a
X-Git-Newrev: 8a847ff428e5dc4ab58a11c5305f6efbb839b2e2
X-Patchwork-Hint: ignore
Message-Id: <20210803211022.5B94787E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gnuradio: bump to
 3.8.2.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=8a847ff428e5dc4ab58a11c5305f6efbb839b2e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Refresh patch 0002-boost_qualify_placeholders_with_their_full_namespace.patch

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...fy_placeholders_with_their_full_namespace.patch | 119 +++++++++------------
 package/gnuradio/gnuradio.hash                     |   2 +-
 package/gnuradio/gnuradio.mk                       |   2 +-
 3 files changed, 55 insertions(+), 68 deletions(-)

diff --git a/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch b/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
index 4f3d892125..431cc12522 100644
--- a/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
+++ b/package/gnuradio/0002-boost_qualify_placeholders_with_their_full_namespace.patch
@@ -1,4 +1,4 @@
-From 5752be31d17be80203d9fc44a73661712542bfe1 Mon Sep 17 00:00:00 2001
+From 5d4c317a372c77aa70df6ab3403d161cd41a7d17 Mon Sep 17 00:00:00 2001
 From: ponce <matteo.bernardini@gmail.com>
 Date: Sun, 17 May 2020 14:02:57 +0200
 Subject: [PATCH] boost: qualify placeholders with their full namespace.
@@ -12,7 +12,6 @@ Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 ---
  .../(exported from wiki) Message Passing.txt  |  8 +++---
  gnuradio-runtime/lib/block.cc                 |  3 ++-
- gr-analog/lib/sig_source_impl.cc              |  4 ++-
  gr-blocks/lib/copy_impl.cc                    |  4 ++-
  gr-blocks/lib/message_debug_impl.cc           | 13 +++++++---
  gr-blocks/lib/message_strobe_impl.cc          |  5 ++--
@@ -59,10 +58,10 @@ Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
  gr-uhd/lib/usrp_source_impl.cc                |  5 ++--
  gr-zeromq/lib/pub_msg_sink_impl.cc            |  4 ++-
  gr-zeromq/lib/push_msg_sink_impl.cc           |  4 ++-
- 49 files changed, 216 insertions(+), 107 deletions(-)
+ 48 files changed, 213 insertions(+), 106 deletions(-)
 
 diff --git a/docs/usage-manual/(exported from wiki) Message Passing.txt b/docs/usage-manual/(exported from wiki) Message Passing.txt
-index 4654bd5dac..551e710228 100644
+index 4654bd5da..551e71022 100644
 --- a/docs/usage-manual/(exported from wiki) Message Passing.txt	
 +++ b/docs/usage-manual/(exported from wiki) Message Passing.txt	
 @@ -94,7 +94,7 @@ must then bind this port to the message handler. For this, we use
@@ -94,7 +93,7 @@ index 4654bd5dac..551e710228 100644
  </syntaxhighlight>
  
 diff --git a/gnuradio-runtime/lib/block.cc b/gnuradio-runtime/lib/block.cc
-index 5914283908..fca4cab97e 100644
+index 591428390..fca4cab97 100644
 --- a/gnuradio-runtime/lib/block.cc
 +++ b/gnuradio-runtime/lib/block.cc
 @@ -61,7 +61,8 @@ block::block(const std::string& name,
@@ -107,23 +106,8 @@ index 5914283908..fca4cab97e 100644
  
      configure_default_loggers(d_logger, d_debug_logger, symbol_name());
  }
-diff --git a/gr-analog/lib/sig_source_impl.cc b/gr-analog/lib/sig_source_impl.cc
-index b73b32982d..01c5fbfdb0 100644
---- a/gr-analog/lib/sig_source_impl.cc
-+++ b/gr-analog/lib/sig_source_impl.cc
-@@ -67,7 +67,9 @@ sig_source_impl<T>::sig_source_impl(double sampling_freq,
-     this->set_phase(phase);
-     this->message_port_register_in(pmt::mp("freq"));
-     this->set_msg_handler(pmt::mp("freq"),
--                          boost::bind(&sig_source_impl<T>::set_frequency_msg, this, _1));
-+                          boost::bind(&sig_source_impl<T>::set_frequency_msg,
-+                                      this,
-+                                      boost::placeholders::_1));
- }
- 
- template <class T>
 diff --git a/gr-blocks/lib/copy_impl.cc b/gr-blocks/lib/copy_impl.cc
-index c377e57b1e..b55196c24b 100644
+index c377e57b1..b55196c24 100644
 --- a/gr-blocks/lib/copy_impl.cc
 +++ b/gr-blocks/lib/copy_impl.cc
 @@ -44,7 +44,9 @@ copy_impl::copy_impl(size_t itemsize)
@@ -138,7 +122,7 @@ index c377e57b1e..b55196c24b 100644
  
  copy_impl::~copy_impl() {}
 diff --git a/gr-blocks/lib/message_debug_impl.cc b/gr-blocks/lib/message_debug_impl.cc
-index a8c84aa509..916f97ca3d 100644
+index a8c84aa50..916f97ca3 100644
 --- a/gr-blocks/lib/message_debug_impl.cc
 +++ b/gr-blocks/lib/message_debug_impl.cc
 @@ -90,14 +90,19 @@ message_debug_impl::message_debug_impl()
@@ -166,7 +150,7 @@ index a8c84aa509..916f97ca3d 100644
  
  message_debug_impl::~message_debug_impl() {}
 diff --git a/gr-blocks/lib/message_strobe_impl.cc b/gr-blocks/lib/message_strobe_impl.cc
-index 038eeae5a1..d131b81662 100644
+index 038eeae5a..d131b8166 100644
 --- a/gr-blocks/lib/message_strobe_impl.cc
 +++ b/gr-blocks/lib/message_strobe_impl.cc
 @@ -53,8 +53,9 @@ message_strobe_impl::message_strobe_impl(pmt::pmt_t msg, long period_ms)
@@ -182,7 +166,7 @@ index 038eeae5a1..d131b81662 100644
  
  message_strobe_impl::~message_strobe_impl() {}
 diff --git a/gr-blocks/lib/message_strobe_random_impl.cc b/gr-blocks/lib/message_strobe_random_impl.cc
-index 0ab5d6adc7..53e641fba4 100644
+index 0ab5d6adc..53e641fba 100644
 --- a/gr-blocks/lib/message_strobe_random_impl.cc
 +++ b/gr-blocks/lib/message_strobe_random_impl.cc
 @@ -74,8 +74,9 @@ message_strobe_random_impl::message_strobe_random_impl(
@@ -198,7 +182,7 @@ index 0ab5d6adc7..53e641fba4 100644
  
  long message_strobe_random_impl::next_delay()
 diff --git a/gr-blocks/lib/multiply_matrix_impl.cc b/gr-blocks/lib/multiply_matrix_impl.cc
-index e1b9c746c6..e38953baba 100644
+index e1b9c746c..e38953bab 100644
 --- a/gr-blocks/lib/multiply_matrix_impl.cc
 +++ b/gr-blocks/lib/multiply_matrix_impl.cc
 @@ -235,9 +235,10 @@ multiply_matrix_impl<gr_complex>::multiply_matrix_impl(
@@ -227,7 +211,7 @@ index e1b9c746c6..e38953baba 100644
  
  
 diff --git a/gr-blocks/lib/mute_impl.cc b/gr-blocks/lib/mute_impl.cc
-index bd65ce2075..5c732f8f4f 100644
+index bd65ce207..5c732f8f4 100644
 --- a/gr-blocks/lib/mute_impl.cc
 +++ b/gr-blocks/lib/mute_impl.cc
 @@ -47,8 +47,9 @@ mute_impl<T>::mute_impl(bool mute)
@@ -243,7 +227,7 @@ index bd65ce2075..5c732f8f4f 100644
  
  template <class T>
 diff --git a/gr-blocks/lib/nop_impl.cc b/gr-blocks/lib/nop_impl.cc
-index db216d97a4..e9baee5878 100644
+index db216d97a..e9baee587 100644
 --- a/gr-blocks/lib/nop_impl.cc
 +++ b/gr-blocks/lib/nop_impl.cc
 @@ -44,8 +44,9 @@ nop_impl::nop_impl(size_t sizeof_stream_item)
@@ -259,7 +243,7 @@ index db216d97a4..e9baee5878 100644
  
  nop_impl::~nop_impl() {}
 diff --git a/gr-blocks/lib/pdu_filter_impl.cc b/gr-blocks/lib/pdu_filter_impl.cc
-index b0748eec02..63cfe47e4c 100644
+index b0748eec0..63cfe47e4 100644
 --- a/gr-blocks/lib/pdu_filter_impl.cc
 +++ b/gr-blocks/lib/pdu_filter_impl.cc
 @@ -44,8 +44,9 @@ pdu_filter_impl::pdu_filter_impl(pmt::pmt_t k, pmt::pmt_t v, bool invert)
@@ -275,7 +259,7 @@ index b0748eec02..63cfe47e4c 100644
  
  void pdu_filter_impl::handle_msg(pmt::pmt_t pdu)
 diff --git a/gr-blocks/lib/pdu_remove_impl.cc b/gr-blocks/lib/pdu_remove_impl.cc
-index 19cc4dc76a..2b97f827b2 100644
+index 19cc4dc76..2b97f827b 100644
 --- a/gr-blocks/lib/pdu_remove_impl.cc
 +++ b/gr-blocks/lib/pdu_remove_impl.cc
 @@ -42,8 +42,9 @@ pdu_remove_impl::pdu_remove_impl(pmt::pmt_t k)
@@ -291,7 +275,7 @@ index 19cc4dc76a..2b97f827b2 100644
  
  void pdu_remove_impl::handle_msg(pmt::pmt_t pdu)
 diff --git a/gr-blocks/lib/pdu_set_impl.cc b/gr-blocks/lib/pdu_set_impl.cc
-index 40fbc3cd83..af59ef70f3 100644
+index 40fbc3cd8..af59ef70f 100644
 --- a/gr-blocks/lib/pdu_set_impl.cc
 +++ b/gr-blocks/lib/pdu_set_impl.cc
 @@ -43,7 +43,9 @@ pdu_set_impl::pdu_set_impl(pmt::pmt_t k, pmt::pmt_t v)
@@ -306,7 +290,7 @@ index 40fbc3cd83..af59ef70f3 100644
  
  void pdu_set_impl::handle_msg(pmt::pmt_t pdu)
 diff --git a/gr-blocks/lib/random_pdu_impl.cc b/gr-blocks/lib/random_pdu_impl.cc
-index 75d825aefa..6c142c3531 100644
+index 75d825aef..6c142c353 100644
 --- a/gr-blocks/lib/random_pdu_impl.cc
 +++ b/gr-blocks/lib/random_pdu_impl.cc
 @@ -52,8 +52,9 @@ random_pdu_impl::random_pdu_impl(int min_items,
@@ -322,7 +306,7 @@ index 75d825aefa..6c142c3531 100644
          throw std::runtime_error("length_module must be >= 1");
      if (max_items < length_modulo)
 diff --git a/gr-blocks/lib/repeat_impl.cc b/gr-blocks/lib/repeat_impl.cc
-index 189fbc8948..d6569625da 100644
+index 189fbc894..d6569625d 100644
 --- a/gr-blocks/lib/repeat_impl.cc
 +++ b/gr-blocks/lib/repeat_impl.cc
 @@ -44,8 +44,9 @@ repeat_impl::repeat_impl(size_t itemsize, int interp)
@@ -338,7 +322,7 @@ index 189fbc8948..d6569625da 100644
  
  void repeat_impl::msg_set_interpolation(pmt::pmt_t msg)
 diff --git a/gr-blocks/lib/socket_pdu_impl.cc b/gr-blocks/lib/socket_pdu_impl.cc
-index df69f07ad2..163eec3a68 100644
+index df69f07ad..163eec3a6 100644
 --- a/gr-blocks/lib/socket_pdu_impl.cc
 +++ b/gr-blocks/lib/socket_pdu_impl.cc
 @@ -101,7 +101,9 @@ socket_pdu_impl::socket_pdu_impl(std::string type,
@@ -388,7 +372,7 @@ index df69f07ad2..163eec3a68 100644
          throw std::runtime_error("gr::blocks:socket_pdu: unknown socket type");
  
 diff --git a/gr-blocks/lib/tagged_stream_multiply_length_impl.cc b/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
-index 30f4c46dc6..34b95d647d 100644
+index 30f4c46dc..34b95d647 100644
 --- a/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
 +++ b/gr-blocks/lib/tagged_stream_multiply_length_impl.cc
 @@ -49,9 +49,10 @@ tagged_stream_multiply_length_impl::tagged_stream_multiply_length_impl(
@@ -406,7 +390,7 @@ index 30f4c46dc6..34b95d647d 100644
  
  tagged_stream_multiply_length_impl::~tagged_stream_multiply_length_impl() {}
 diff --git a/gr-blocks/lib/tuntap_pdu_impl.cc b/gr-blocks/lib/tuntap_pdu_impl.cc
-index 4343ae1dc3..0d9d7e28c7 100644
+index 4343ae1dc..0d9d7e28c 100644
 --- a/gr-blocks/lib/tuntap_pdu_impl.cc
 +++ b/gr-blocks/lib/tuntap_pdu_impl.cc
 @@ -96,7 +96,8 @@ tuntap_pdu_impl::tuntap_pdu_impl(std::string dev, int MTU, bool istunflag)
@@ -420,7 +404,7 @@ index 4343ae1dc3..0d9d7e28c7 100644
  
  int tuntap_pdu_impl::tun_alloc(char* dev, int flags)
 diff --git a/gr-digital/lib/chunks_to_symbols_impl.cc b/gr-digital/lib/chunks_to_symbols_impl.cc
-index 26d590a66e..a6810a69eb 100644
+index 26d590a66..a6810a69e 100644
 --- a/gr-digital/lib/chunks_to_symbols_impl.cc
 +++ b/gr-digital/lib/chunks_to_symbols_impl.cc
 @@ -53,8 +53,9 @@ chunks_to_symbols_impl<IN_T, OUT_T>::chunks_to_symbols_impl(
@@ -436,7 +420,7 @@ index 26d590a66e..a6810a69eb 100644
  
  template <class IN_T, class OUT_T>
 diff --git a/gr-digital/lib/constellation_receiver_cb_impl.cc b/gr-digital/lib/constellation_receiver_cb_impl.cc
-index 7fb7559d5e..7e216ece56 100644
+index 7fb7559d5..7e216ece5 100644
 --- a/gr-digital/lib/constellation_receiver_cb_impl.cc
 +++ b/gr-digital/lib/constellation_receiver_cb_impl.cc
 @@ -61,14 +61,16 @@ constellation_receiver_cb_impl::constellation_receiver_cb_impl(
@@ -463,7 +447,7 @@ index 7fb7559d5e..7e216ece56 100644
  
  constellation_receiver_cb_impl::~constellation_receiver_cb_impl() {}
 diff --git a/gr-digital/lib/costas_loop_cc_impl.cc b/gr-digital/lib/costas_loop_cc_impl.cc
-index c3b30834eb..e1229e6f4a 100644
+index c3b30834e..e1229e6f4 100644
 --- a/gr-digital/lib/costas_loop_cc_impl.cc
 +++ b/gr-digital/lib/costas_loop_cc_impl.cc
 @@ -82,7 +82,9 @@ costas_loop_cc_impl::costas_loop_cc_impl(float loop_bw, int order, bool use_snr)
@@ -478,7 +462,7 @@ index c3b30834eb..e1229e6f4a 100644
  
  costas_loop_cc_impl::~costas_loop_cc_impl() {}
 diff --git a/gr-digital/lib/crc32_async_bb_impl.cc b/gr-digital/lib/crc32_async_bb_impl.cc
-index bffbb2a737..66143866c0 100644
+index bffbb2a73..66143866c 100644
 --- a/gr-digital/lib/crc32_async_bb_impl.cc
 +++ b/gr-digital/lib/crc32_async_bb_impl.cc
 @@ -48,9 +48,13 @@ crc32_async_bb_impl::crc32_async_bb_impl(bool check)
@@ -498,7 +482,7 @@ index bffbb2a737..66143866c0 100644
  
  crc32_async_bb_impl::~crc32_async_bb_impl() {}
 diff --git a/gr-digital/lib/header_payload_demux_impl.cc b/gr-digital/lib/header_payload_demux_impl.cc
-index 98c805fb20..7cc1e0a4ed 100644
+index 98c805fb2..7cc1e0a4e 100644
 --- a/gr-digital/lib/header_payload_demux_impl.cc
 +++ b/gr-digital/lib/header_payload_demux_impl.cc
 @@ -150,9 +150,10 @@ header_payload_demux_impl::header_payload_demux_impl(
@@ -516,7 +500,7 @@ index 98c805fb20..7cc1e0a4ed 100644
          d_special_tags.push_back(pmt::string_to_symbol(special_tags[i]));
          d_special_tags_last_value.push_back(pmt::PMT_NIL);
 diff --git a/gr-digital/lib/protocol_formatter_async_impl.cc b/gr-digital/lib/protocol_formatter_async_impl.cc
-index 84b693745d..c08bbb9aeb 100644
+index 84b693745..c08bbb9ae 100644
 --- a/gr-digital/lib/protocol_formatter_async_impl.cc
 +++ b/gr-digital/lib/protocol_formatter_async_impl.cc
 @@ -55,7 +55,9 @@ protocol_formatter_async_impl::protocol_formatter_async_impl(
@@ -531,7 +515,7 @@ index 84b693745d..c08bbb9aeb 100644
  
  protocol_formatter_async_impl::~protocol_formatter_async_impl() {}
 diff --git a/gr-fec/lib/async_decoder_impl.cc b/gr-fec/lib/async_decoder_impl.cc
-index e7a668c832..5d68d13ae7 100644
+index e7a668c83..5d68d13ae 100644
 --- a/gr-fec/lib/async_decoder_impl.cc
 +++ b/gr-fec/lib/async_decoder_impl.cc
 @@ -65,10 +65,14 @@ async_decoder_impl::async_decoder_impl(generic_decoder::sptr my_decoder,
@@ -552,7 +536,7 @@ index e7a668c832..5d68d13ae7 100644
  
      // The maximum frame size is set by the initial frame size of the decoder.
 diff --git a/gr-fec/lib/async_encoder_impl.cc b/gr-fec/lib/async_encoder_impl.cc
-index 811d55601f..506ae5c7e9 100644
+index 811d55601..506ae5c7e 100644
 --- a/gr-fec/lib/async_encoder_impl.cc
 +++ b/gr-fec/lib/async_encoder_impl.cc
 @@ -64,7 +64,9 @@ async_encoder_impl::async_encoder_impl(generic_encoder::sptr my_encoder,
@@ -578,7 +562,7 @@ index 811d55601f..506ae5c7e9 100644
  
      if (d_packed || (strncmp(d_encoder->get_input_conversion(), "pack", 4) == 0)) {
 diff --git a/gr-fec/lib/depuncture_bb_impl.cc b/gr-fec/lib/depuncture_bb_impl.cc
-index 27d00bb5bb..f64dad45fc 100644
+index 27d00bb5b..f64dad45f 100644
 --- a/gr-fec/lib/depuncture_bb_impl.cc
 +++ b/gr-fec/lib/depuncture_bb_impl.cc
 @@ -74,7 +74,9 @@ depuncture_bb_impl::depuncture_bb_impl(int puncsize, int puncpat, int delay, cha
@@ -593,7 +577,7 @@ index 27d00bb5bb..f64dad45fc 100644
  
  depuncture_bb_impl::~depuncture_bb_impl() {}
 diff --git a/gr-fec/lib/puncture_bb_impl.cc b/gr-fec/lib/puncture_bb_impl.cc
-index a365d6a69f..f2078d8c57 100644
+index a365d6a69..f2078d8c5 100644
 --- a/gr-fec/lib/puncture_bb_impl.cc
 +++ b/gr-fec/lib/puncture_bb_impl.cc
 @@ -72,7 +72,9 @@ puncture_bb_impl::puncture_bb_impl(int puncsize, int puncpat, int delay)
@@ -608,7 +592,7 @@ index a365d6a69f..f2078d8c57 100644
  
  puncture_bb_impl::~puncture_bb_impl() {}
 diff --git a/gr-fec/lib/puncture_ff_impl.cc b/gr-fec/lib/puncture_ff_impl.cc
-index c95288d691..95fb649a8b 100644
+index c95288d69..95fb649a8 100644
 --- a/gr-fec/lib/puncture_ff_impl.cc
 +++ b/gr-fec/lib/puncture_ff_impl.cc
 @@ -72,7 +72,9 @@ puncture_ff_impl::puncture_ff_impl(int puncsize, int puncpat, int delay)
@@ -623,7 +607,7 @@ index c95288d691..95fb649a8b 100644
  
  puncture_ff_impl::~puncture_ff_impl() {}
 diff --git a/gr-filter/lib/freq_xlating_fir_filter_impl.cc b/gr-filter/lib/freq_xlating_fir_filter_impl.cc
-index 8ddc967ba1..50ec589472 100644
+index 8ddc967ba..50ec58947 100644
 --- a/gr-filter/lib/freq_xlating_fir_filter_impl.cc
 +++ b/gr-filter/lib/freq_xlating_fir_filter_impl.cc
 @@ -72,7 +72,7 @@ freq_xlating_fir_filter_impl<IN_T, OUT_T, TAP_T>::freq_xlating_fir_filter_impl(
@@ -636,7 +620,7 @@ index 8ddc967ba1..50ec589472 100644
  
  template <class IN_T, class OUT_T, class TAP_T>
 diff --git a/gr-filter/lib/mmse_resampler_cc_impl.cc b/gr-filter/lib/mmse_resampler_cc_impl.cc
-index 59f9eacfab..bdce51716a 100644
+index 59f9eacfa..bdce51716 100644
 --- a/gr-filter/lib/mmse_resampler_cc_impl.cc
 +++ b/gr-filter/lib/mmse_resampler_cc_impl.cc
 @@ -52,8 +52,9 @@ mmse_resampler_cc_impl::mmse_resampler_cc_impl(float phase_shift, float resamp_r
@@ -652,7 +636,7 @@ index 59f9eacfab..bdce51716a 100644
  
  mmse_resampler_cc_impl::~mmse_resampler_cc_impl() { delete d_resamp; }
 diff --git a/gr-filter/lib/mmse_resampler_ff_impl.cc b/gr-filter/lib/mmse_resampler_ff_impl.cc
-index 342d9f7678..3d72727114 100644
+index 342d9f767..3d7272711 100644
 --- a/gr-filter/lib/mmse_resampler_ff_impl.cc
 +++ b/gr-filter/lib/mmse_resampler_ff_impl.cc
 @@ -53,8 +53,9 @@ mmse_resampler_ff_impl::mmse_resampler_ff_impl(float phase_shift, float resamp_r
@@ -668,7 +652,7 @@ index 342d9f7678..3d72727114 100644
  
  mmse_resampler_ff_impl::~mmse_resampler_ff_impl() { delete d_resamp; }
 diff --git a/gr-qtgui/lib/const_sink_c_impl.cc b/gr-qtgui/lib/const_sink_c_impl.cc
-index 852f6ee109..04d421d037 100644
+index 852f6ee10..04d421d03 100644
 --- a/gr-qtgui/lib/const_sink_c_impl.cc
 +++ b/gr-qtgui/lib/const_sink_c_impl.cc
 @@ -69,8 +69,9 @@ const_sink_c_impl::const_sink_c_impl(int size,
@@ -684,7 +668,7 @@ index 852f6ee109..04d421d037 100644
      for (int i = 0; i < d_nconnections; i++) {
          d_residbufs_real.push_back(
 diff --git a/gr-qtgui/lib/edit_box_msg_impl.cc b/gr-qtgui/lib/edit_box_msg_impl.cc
-index 8713aa820e..39546cbf3a 100644
+index 8713aa820..39546cbf3 100644
 --- a/gr-qtgui/lib/edit_box_msg_impl.cc
 +++ b/gr-qtgui/lib/edit_box_msg_impl.cc
 @@ -158,7 +158,9 @@ edit_box_msg_impl::edit_box_msg_impl(data_type_t type,
@@ -699,7 +683,7 @@ index 8713aa820e..39546cbf3a 100644
  
  edit_box_msg_impl::~edit_box_msg_impl()
 diff --git a/gr-qtgui/lib/freq_sink_c_impl.cc b/gr-qtgui/lib/freq_sink_c_impl.cc
-index 3a34df6ec6..fe231699fd 100644
+index 3a34df6ec..fe231699f 100644
 --- a/gr-qtgui/lib/freq_sink_c_impl.cc
 +++ b/gr-qtgui/lib/freq_sink_c_impl.cc
 @@ -82,17 +82,23 @@ freq_sink_c_impl::freq_sink_c_impl(int fftsize,
@@ -730,7 +714,7 @@ index 3a34df6ec6..fe231699fd 100644
      d_main_gui = NULL;
  
 diff --git a/gr-qtgui/lib/freq_sink_f_impl.cc b/gr-qtgui/lib/freq_sink_f_impl.cc
-index c14bfc31fd..7090d8699e 100644
+index c14bfc31f..7090d8699 100644
 --- a/gr-qtgui/lib/freq_sink_f_impl.cc
 +++ b/gr-qtgui/lib/freq_sink_f_impl.cc
 @@ -82,17 +82,23 @@ freq_sink_f_impl::freq_sink_f_impl(int fftsize,
@@ -761,7 +745,7 @@ index c14bfc31fd..7090d8699e 100644
      d_main_gui = NULL;
  
 diff --git a/gr-qtgui/lib/histogram_sink_f_impl.cc b/gr-qtgui/lib/histogram_sink_f_impl.cc
-index d16de932ca..1602d18968 100644
+index d16de932c..1602d1896 100644
 --- a/gr-qtgui/lib/histogram_sink_f_impl.cc
 +++ b/gr-qtgui/lib/histogram_sink_f_impl.cc
 @@ -81,8 +81,9 @@ histogram_sink_f_impl::histogram_sink_f_impl(int size,
@@ -777,7 +761,7 @@ index d16de932ca..1602d18968 100644
      // +1 for the PDU buffer
      for (int i = 0; i < d_nconnections + 1; i++) {
 diff --git a/gr-qtgui/lib/sink_c_impl.cc b/gr-qtgui/lib/sink_c_impl.cc
-index d3feb9d16c..73136e789e 100644
+index d3feb9d16..73136e789 100644
 --- a/gr-qtgui/lib/sink_c_impl.cc
 +++ b/gr-qtgui/lib/sink_c_impl.cc
 @@ -96,7 +96,9 @@ sink_c_impl::sink_c_impl(int fftsize,
@@ -792,7 +776,7 @@ index d3feb9d16c..73136e789e 100644
      d_main_gui = NULL;
  
 diff --git a/gr-qtgui/lib/sink_f_impl.cc b/gr-qtgui/lib/sink_f_impl.cc
-index 418b630b78..d31023a51d 100644
+index 418b630b7..d31023a51 100644
 --- a/gr-qtgui/lib/sink_f_impl.cc
 +++ b/gr-qtgui/lib/sink_f_impl.cc
 @@ -95,7 +95,9 @@ sink_f_impl::sink_f_impl(int fftsize,
@@ -807,7 +791,7 @@ index 418b630b78..d31023a51d 100644
      d_main_gui = NULL;
  
 diff --git a/gr-qtgui/lib/time_raster_sink_b_impl.cc b/gr-qtgui/lib/time_raster_sink_b_impl.cc
-index 045c216b00..3aa503ccfc 100644
+index 045c216b0..3aa503ccf 100644
 --- a/gr-qtgui/lib/time_raster_sink_b_impl.cc
 +++ b/gr-qtgui/lib/time_raster_sink_b_impl.cc
 @@ -84,7 +84,9 @@ time_raster_sink_b_impl::time_raster_sink_b_impl(double samp_rate,
@@ -822,7 +806,7 @@ index 045c216b00..3aa503ccfc 100644
      d_scale = 1.0f;
  
 diff --git a/gr-qtgui/lib/time_raster_sink_f_impl.cc b/gr-qtgui/lib/time_raster_sink_f_impl.cc
-index d186f319da..b3516e5be9 100644
+index d186f319d..b3516e5be 100644
 --- a/gr-qtgui/lib/time_raster_sink_f_impl.cc
 +++ b/gr-qtgui/lib/time_raster_sink_f_impl.cc
 @@ -84,7 +84,9 @@ time_raster_sink_f_impl::time_raster_sink_f_impl(double samp_rate,
@@ -837,7 +821,7 @@ index d186f319da..b3516e5be9 100644
      d_icols = static_cast<int>(ceil(d_cols));
      d_tmpflt = (float*)volk_malloc(d_icols * sizeof(float), volk_get_alignment());
 diff --git a/gr-qtgui/lib/time_sink_c_impl.cc b/gr-qtgui/lib/time_sink_c_impl.cc
-index b73a1c1ad3..83fbda298a 100644
+index b73a1c1ad..83fbda298 100644
 --- a/gr-qtgui/lib/time_sink_c_impl.cc
 +++ b/gr-qtgui/lib/time_sink_c_impl.cc
 @@ -80,7 +80,9 @@ time_sink_c_impl::time_sink_c_impl(int size,
@@ -852,7 +836,7 @@ index b73a1c1ad3..83fbda298a 100644
      // +2 for the PDU message buffers
      for (unsigned int n = 0; n < d_nconnections + 2; n++) {
 diff --git a/gr-qtgui/lib/time_sink_f_impl.cc b/gr-qtgui/lib/time_sink_f_impl.cc
-index df13998d75..dd5ed12c8b 100644
+index df13998d7..dd5ed12c8 100644
 --- a/gr-qtgui/lib/time_sink_f_impl.cc
 +++ b/gr-qtgui/lib/time_sink_f_impl.cc
 @@ -80,7 +80,9 @@ time_sink_f_impl::time_sink_f_impl(int size,
@@ -867,7 +851,7 @@ index df13998d75..dd5ed12c8b 100644
      // +1 for the PDU buffer
      for (unsigned int n = 0; n < d_nconnections + 1; n++) {
 diff --git a/gr-qtgui/lib/waterfall_sink_c_impl.cc b/gr-qtgui/lib/waterfall_sink_c_impl.cc
-index fcf2ed98bc..da38d32baa 100644
+index fcf2ed98b..da38d32ba 100644
 --- a/gr-qtgui/lib/waterfall_sink_c_impl.cc
 +++ b/gr-qtgui/lib/waterfall_sink_c_impl.cc
 @@ -118,19 +118,24 @@ waterfall_sink_c_impl::waterfall_sink_c_impl(int fftsize,
@@ -900,7 +884,7 @@ index fcf2ed98bc..da38d32baa 100644
  
  waterfall_sink_c_impl::~waterfall_sink_c_impl()
 diff --git a/gr-qtgui/lib/waterfall_sink_f_impl.cc b/gr-qtgui/lib/waterfall_sink_f_impl.cc
-index aa1037a472..d4231a564c 100644
+index aa1037a47..d4231a564 100644
 --- a/gr-qtgui/lib/waterfall_sink_f_impl.cc
 +++ b/gr-qtgui/lib/waterfall_sink_f_impl.cc
 @@ -116,19 +116,24 @@ waterfall_sink_f_impl::waterfall_sink_f_impl(int fftsize,
@@ -933,7 +917,7 @@ index aa1037a472..d4231a564c 100644
  
  waterfall_sink_f_impl::~waterfall_sink_f_impl()
 diff --git a/gr-uhd/lib/usrp_block_impl.cc b/gr-uhd/lib/usrp_block_impl.cc
-index 4f030159ff..697d633c1b 100644
+index 4f030159f..697d633c1 100644
 --- a/gr-uhd/lib/usrp_block_impl.cc
 +++ b/gr-uhd/lib/usrp_block_impl.cc
 @@ -137,12 +137,18 @@ usrp_block_impl::usrp_block_impl(const ::uhd::device_addr_t& device_addr,
@@ -978,7 +962,7 @@ index 4f030159ff..697d633c1b 100644
                  d_logger,
                  boost::format(
 diff --git a/gr-uhd/lib/usrp_source_impl.cc b/gr-uhd/lib/usrp_source_impl.cc
-index a2ff0821bd..5e6bd43285 100644
+index a2ff0821b..5e6bd4328 100644
 --- a/gr-uhd/lib/usrp_source_impl.cc
 +++ b/gr-uhd/lib/usrp_source_impl.cc
 @@ -57,8 +57,9 @@ usrp_source_impl::usrp_source_impl(const ::uhd::device_addr_t& device_addr,
@@ -994,7 +978,7 @@ index a2ff0821bd..5e6bd43285 100644
  
  usrp_source_impl::~usrp_source_impl() {}
 diff --git a/gr-zeromq/lib/pub_msg_sink_impl.cc b/gr-zeromq/lib/pub_msg_sink_impl.cc
-index b5da7421ef..957cfa411d 100644
+index b5da7421e..957cfa411 100644
 --- a/gr-zeromq/lib/pub_msg_sink_impl.cc
 +++ b/gr-zeromq/lib/pub_msg_sink_impl.cc
 @@ -62,7 +62,9 @@ pub_msg_sink_impl::pub_msg_sink_impl(char* address, int timeout, bool bind)
@@ -1009,7 +993,7 @@ index b5da7421ef..957cfa411d 100644
  
  pub_msg_sink_impl::~pub_msg_sink_impl()
 diff --git a/gr-zeromq/lib/push_msg_sink_impl.cc b/gr-zeromq/lib/push_msg_sink_impl.cc
-index 4140781ab9..7d07d3a30e 100644
+index 4140781ab..7d07d3a30 100644
 --- a/gr-zeromq/lib/push_msg_sink_impl.cc
 +++ b/gr-zeromq/lib/push_msg_sink_impl.cc
 @@ -62,7 +62,9 @@ push_msg_sink_impl::push_msg_sink_impl(char* address, int timeout, bool bind)
@@ -1023,3 +1007,6 @@ index 4140781ab9..7d07d3a30e 100644
  }
  
  push_msg_sink_impl::~push_msg_sink_impl()
+-- 
+2.26.2
+
diff --git a/package/gnuradio/gnuradio.hash b/package/gnuradio/gnuradio.hash
index 2f147761d8..e47c5faaba 100644
--- a/package/gnuradio/gnuradio.hash
+++ b/package/gnuradio/gnuradio.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 e15311e7da9fe2bb790cc36321d7eb2d93b9dfa0c1552fa5d534dd99d22873be  gnuradio-3.8.1.0.tar.gz
+sha256 3e293541a9ac8d78660762bae8b80c0f6195b3494e1c50c01a9fd79cc60bb624  gnuradio-3.8.2.0.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 1f4458db92..d8292dac08 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNURADIO_VERSION = 3.8.1.0
+GNURADIO_VERSION = 3.8.2.0
 GNURADIO_SITE = https://github.com/gnuradio/gnuradio/releases/download/v$(GNURADIO_VERSION)
 GNURADIO_LICENSE = GPL-3.0+
 GNURADIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
