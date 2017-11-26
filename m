From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:10:06 +0100
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.10 (security)
In-Reply-To: <1510001601-29419-1-git-send-email-nerv@dawncrow.de>
 (=?utf-8?Q?=22Andr=C3=A9?=
 Hentschel"'s message of "Mon, 6 Nov 2017 21:53:21 +0100")
References: <1510001601-29419-1-git-send-email-nerv@dawncrow.de>
Message-ID: <87tvxgg30x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andr?" == Andr? Hentschel <nerv@dawncrow.de> writes:

 > Security fixes since 2.2.7:
 > - wnpa-sec-2017-22
 >   Bazaar dissector infinite loop (Bug 13599) CVE-2017-9352
 > - wnpa-sec-2017-23
 >   DOF dissector read overflow (Bug 13608) CVE-2017-9348
 > - wnpa-sec-2017-24
 >   DHCP dissector read overflow (Bug 13609, Bug 13628) CVE-2017-9351
 > - wnpa-sec-2017-25
 >   SoulSeek dissector infinite loop (Bug 13631) CVE-2017-9346
 > - wnpa-sec-2017-26
 >   DNS dissector infinite loop (Bug 13633) CVE-2017-9345
 > - wnpa-sec-2017-27
 >   DICOM dissector infinite loop (Bug 13685) CVE-2017-9349
 > - wnpa-sec-2017-28
 >   openSAFETY dissector memory exhaustion (Bug 13649) CVE-2017-9350
 > - wnpa-sec-2017-29
 >   BT L2CAP dissector divide by zero (Bug 13701) CVE-2017-9344
 > - wnpa-sec-2017-30
 >   MSNIP dissector crash (Bug 13725) CVE-2017-9343
 > - wnpa-sec-2017-31
 >   ROS dissector crash (Bug 13637) CVE-2017-9347
 > - wnpa-sec-2017-32
 >   RGMP dissector crash (Bug 13646) CVE-2017-9354
 > - wnpa-sec-2017-33
 >   IPv6 dissector crash (Bug 13675) CVE-2017-9353
 > - wnpa-sec-2017-13
 >   WBMXL dissector infinite loop (Bug 13477, Bug 13796) CVE-2017-7702, CVE-2017-11410
 >   Note: This is an update for a fix in Wireshark 2.2.6 and 2.0.12.
 > - wnpa-sec-2017-28
 >   openSAFETY dissector memory exhaustion (Bug 13649, Bug 13755) CVE-2017-9350, CVE-2017-11411
 >   Note: This is an update for a fix in Wireshark 2.2.7.
 > - wnpa-sec-2017-34
 >   AMQP dissector crash. (Bug 13780) CVE-2017-11408
 > - wnpa-sec-2017-35
 >   MQ dissector crash. (Bug 13792) CVE-2017-11407
 > - wnpa-sec-2017-36
 >   DOCSIS infinite loop. (Bug 13797) CVE-2017-11406
 > - wnpa-sec-2017-38
 >   MSDP dissector infinite loop (Bug 13933)
 > - wnpa-sec-2017-39
 >   Profinet I/O buffer overrun (Bug 13847)
 > - wnpa-sec-2017-41
 >   IrCOMM dissector buffer overrun (Bug 13929)

 > Full release notes:

 >   https://www.wireshark.org/docs/relnotes/wireshark-2.2.10.html

 > Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>

Committed to 2017.02.x and 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
