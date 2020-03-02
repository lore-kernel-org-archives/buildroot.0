From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2020 22:50:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 v3.2.2
In-Reply-To: <20200302103417.204110-1-titouan.christophe@railnova.eu> (Titouan
 Christophe's message of "Mon, 2 Mar 2020 11:34:17 +0100")
References: <20200302103417.204110-1-titouan.christophe@railnova.eu>
Message-ID: <8736aqfmup.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouan.christophe@railnova.eu> writes:

 > This fixes the following CVEs:
 >  - CVE-2020-9428:
 >    In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to 2.6.14,
 >    the EAP dissector could crash. This was addressed in
 >    epan/dissectors/packet-eap.c by using more careful sscanf parsing.

 >  - CVE-2020-9429:
 >    In Wireshark 3.2.0 to 3.2.1, the WireGuard dissector could crash.
 >    This was addressed in epan/dissectors/packet-wireguard.c by
 >    handling the situation where a certain data structure intentionally
 >    has a NULL value.

 >  - CVE-2020-9430:
 >    In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to 2.6.14,
 >    the WiMax DLMAP dissector could crash.
 >    This was addressed in plugins/epan/wimax/msg_dlmap.c by validating
 >    a length field.

 >  - CVE-2020-9431:
 >    In Wireshark 3.2.0 to 3.2.1, 3.0.0 to 3.0.8, and 2.6.0 to 2.6.14,
 >    the LTE RRC dissector could leak memory. This was addressed in
 >    epan/dissectors/packet-lte-rrc.c by adjusting certain append operations.

 > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>

Committed, thanks.

-- 
Bye, Peter Korsgaard
