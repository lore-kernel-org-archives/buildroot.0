From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Jun 2017 13:32:16 +0200
Subject: [Buildroot] [PATCH] wireshark: bump version to 2.2.7 (security)
In-Reply-To: <20170602102853.54859-1-Vincent.Riera@imgtec.com> (Vicente
 Olivert Riera's message of "Fri, 2 Jun 2017 11:28:53 +0100")
References: <20170602102853.54859-1-Vincent.Riera@imgtec.com>
Message-ID: <878tlafwvz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security fixes:
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

 > Full release notes:

 >   https://www.wireshark.org/docs/relnotes/wireshark-2.2.7.html

Gaah, I was just thinking that it was a while ago since we've seen any
security issues with wireshark :/

Committed, thanks.

-- 
Bye, Peter Korsgaard
