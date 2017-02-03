From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 03 Feb 2017 14:15:58 +0100
Subject: [Buildroot] [PATCH] tcpdump: security bump to version 4.9.0
In-Reply-To: <c90f71438e578bdeec4c211d113ef5eb726915de.1486100623.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 3 Feb 2017 07:43:43 +0200")
References: <c90f71438e578bdeec4c211d113ef5eb726915de.1486100623.git.baruch@tkos.co.il>
Message-ID: <87zii31kkx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Security fixes in this release (from the Debian changelog):
 >     + CVE-2016-7922: buffer overflow in print-ah.c:ah_print().
 >     + CVE-2016-7923: buffer overflow in print-arp.c:arp_print().
 >     + CVE-2016-7924: buffer overflow in print-atm.c:oam_print().
 >     + CVE-2016-7925: buffer overflow in print-sl.c:sl_if_print().
 >     + CVE-2016-7926: buffer overflow in print-ether.c:ethertype_print().
 >     + CVE-2016-7927: buffer overflow in print-802_11.c:ieee802_11_radio_print().
 >     + CVE-2016-7928: buffer overflow in print-ipcomp.c:ipcomp_print().
 >     + CVE-2016-7929: buffer overflow in print-juniper.c:juniper_parse_header().
 >     + CVE-2016-7930: buffer overflow in print-llc.c:llc_print().
 >     + CVE-2016-7931: buffer overflow in print-mpls.c:mpls_print().
 >     + CVE-2016-7932: buffer overflow in print-pim.c:pimv2_check_checksum().
 >     + CVE-2016-7933: buffer overflow in print-ppp.c:ppp_hdlc_if_print().
 >     + CVE-2016-7934: buffer overflow in print-udp.c:rtcp_print().
 >     + CVE-2016-7935: buffer overflow in print-udp.c:rtp_print().
 >     + CVE-2016-7936: buffer overflow in print-udp.c:udp_print().
 >     + CVE-2016-7937: buffer overflow in print-udp.c:vat_print().
 >     + CVE-2016-7938: integer overflow in print-zeromq.c:zmtp1_print_frame().
 >     + CVE-2016-7939: buffer overflow in print-gre.c, multiple functions.
 >     + CVE-2016-7940: buffer overflow in print-stp.c, multiple functions.
 >     + CVE-2016-7973: buffer overflow in print-atalk.c, multiple functions.
 >     + CVE-2016-7974: buffer overflow in print-ip.c, multiple functions.
 >     + CVE-2016-7975: buffer overflow in print-tcp.c:tcp_print().
 >     + CVE-2016-7983: buffer overflow in print-bootp.c:bootp_print().
 >     + CVE-2016-7984: buffer overflow in print-tftp.c:tftp_print().
 >     + CVE-2016-7985: buffer overflow in print-calm-fast.c:calm_fast_print().
 >     + CVE-2016-7986: buffer overflow in print-geonet.c, multiple functions.
 >     + CVE-2016-7992: buffer overflow in print-cip.c:cip_if_print().
 >     + CVE-2016-7993: a bug in util-print.c:relts_print() could cause a
 >       buffer overflow in multiple protocol parsers (DNS, DVMRP, HSRP, IGMP,
 >       lightweight resolver protocol, PIM).
 >     + CVE-2016-8574: buffer overflow in print-fr.c:frf15_print().
 >     + CVE-2016-8575: buffer overflow in print-fr.c:q933_print().
 >     + CVE-2017-5202: buffer overflow in print-isoclns.c:clnp_print().
 >     + CVE-2017-5203: buffer overflow in print-bootp.c:bootp_print().
 >     + CVE-2017-5204: buffer overflow in print-ip6.c:ip6_print().
 >     + CVE-2017-5205: buffer overflow in print-isakmp.c:ikev2_e_print().
 >     + CVE-2017-5341: buffer overflow in print-otv.c:otv_print().
 >     + CVE-2017-5342: a bug in multiple protocol parsers (Geneve, GRE, NSH,
 >       OTV, VXLAN and VXLAN GPE) could cause a buffer overflow in
 >       print-ether.c:ether_print().
 >     + CVE-2017-5482: buffer overflow in print-fr.c:q933_print().
 >     + CVE-2017-5483: buffer overflow in print-snmp.c:asn1_parse().
 >     + CVE-2017-5484: buffer overflow in print-atm.c:sig_print().
 >     + CVE-2017-5485: buffer overflow in addrtoname.c:lookup_nsap().
 >     + CVE-2017-5486: buffer overflow in print-isoclns.c:clnp_print().

Great, it now finally got "officially" released. Committed, thanks.

-- 
Bye, Peter Korsgaard
