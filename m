From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 22 Dec 2020 09:29:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to
 version 3.4.2
In-Reply-To: <20201218221541.625712-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 18 Dec 2020 23:15:41 +0100")
References: <20201218221541.625712-1-fontaine.fabrice@gmail.com>
Message-ID: <87eejimeew.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > The following vulnerabilities have been fixed:
 >  - wnpa-sec-2020-16 Kafka dissector memory leak. Bug 16739.
 >    CVE-2020-26418.
 >  - wnpa-sec-2020-17 USB HID dissector crash. Bug 16958. CVE-2020-26421.
 >  - wnpa-sec-2020-18 RTPS dissector memory leak. Bug 16994.
 >    CVE-2020-26420.
 >  - wnpa-sec-2020-19 Multiple dissector memory leak. Bug 17032.
 >    CVE-2020-26419.
 >  - wnpa-sec-2020-20 QUIC dissector crash Bug 17073.

 > https://www.wireshark.org/docs/relnotes/wireshark-3.4.1.html
 > https://www.wireshark.org/docs/relnotes/wireshark-3.4.2.html

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.11.x, thanks.

For 2020.02.x and 2020.08.x I will instead bump to 3.2.10, which
contains the same fixes.

-- 
Bye, Peter Korsgaard
