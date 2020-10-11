From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 19:00:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.7
In-Reply-To: <20201010200646.1606023-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Oct 2020 22:06:46 +0200")
References: <20201010200646.1606023-1-fontaine.fabrice@gmail.com>
Message-ID: <87zh4svgta.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2020-25862: In Wireshark 3.2.0 to 3.2.6, 3.0.0 to 3.0.13, and
 >   2.6.0 to 2.6.20, the TCP dissector could crash. This was addressed in
 >   epan/dissectors/packet-tcp.c by changing the handling of the invalid
 >   0xFFFF checksum.
 > - Fix CVE-2020-25863: In Wireshark 3.2.0 to 3.2.6, 3.0.0 to 3.0.13, and
 >   2.6.0 to 2.6.20, the MIME Multipart dissector could crash. This was
 >   addressed in epan/dissectors/packet-multipart.c by correcting the
 >   deallocation of invalid MIME parts.
 > - Fix CVE-2020-25866: In Wireshark 3.2.0 to 3.2.6 and 3.0.0 to 3.0.13,
 >   the BLIP protocol dissector has a NULL pointer dereference because a
 >   buffer was sized for compressed (not uncompressed) messages. This was
 >   addressed in epan/dissectors/packet-blip.c by allowing reasonable
 >   compression ratios and rejecting ZIP bombs.

 > https://www.wireshark.org/docs/relnotes/wireshark-3.2.7.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
