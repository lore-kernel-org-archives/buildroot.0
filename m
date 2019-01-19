From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:33:27 +0100
Subject: [Buildroot] [PATCH] package/wireshark: security bump to version
 2.6.6
In-Reply-To: <20190118080029.30013-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 18 Jan 2019 09:00:28 +0100")
References: <20190118080029.30013-1-peter@korsgaard.com>
Message-ID: <87y37g3bnc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - wnpa-sec-2019-01 The 6LoWPAN dissector could crash. Bug 15217. CVE-2019-5716
 >   https://www.wireshark.org/security/wnpa-sec-2019-01

 > - wnpa-sec-2019-02 The P_MUL dissector could crash. Bug 15337. CVE-2019-5717
 >   https://www.wireshark.org/security/wnpa-sec-2019-02

 > - wnpa-sec-2019-03 The RTSE dissector and other dissectors could crash.  Bug
 >   15373.  CVE-2019-5718
 >   https://www.wireshark.org/security/wnpa-sec-2019-03

 > - wnpa-sec-2019-04 The ISAKMP dissector could crash. Bug 15374. CVE-2019-5719
 >   https://www.wireshark.org/security/wnpa-sec-2019-04

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
