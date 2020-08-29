From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 11:57:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.2.6
In-Reply-To: <20200829075124.962675-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Aug 2020 09:51:24 +0200")
References: <20200829075124.962675-1-fontaine.fabrice@gmail.com>
Message-ID: <878sdxkc5h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-17498: In Wireshark 3.2.0 to 3.2.5, the Kafka protocol
 > dissector could crash. This was addressed in
 > epan/dissectors/packet-kafka.c by avoiding a double free during LZ4
 > decompression.

 > https://www.wireshark.org/security/wnpa-sec-2020-10.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
