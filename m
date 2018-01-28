From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 28 Jan 2018 22:11:43 +0100
Subject: [Buildroot] [PATCH] wireshark: security bump to version 2.2.12
In-Reply-To: <20180128192302.3011-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 28 Jan 2018 20:23:02 +0100")
References: <20180128192302.3011-1-peter@korsgaard.com>
Message-ID: <87mv0xadtc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-17997: MRDISC dissector crash
 > https://www.wireshark.org/security/wnpa-sec-2018-02.html

 > CVE-2018-5334: IxVeriWave file parser crash
 > https://www.wireshark.org/security/wnpa-sec-2018-03.html

 > CVE-2018-5335: WCP dissector crash
 > https://www.wireshark.org/security/wnpa-sec-2018-04.html

 > CVE-2018-5336: Multiple dissectors could crash
 > https://www.wireshark.org/security/wnpa-sec-2018-01.html

 > For more information, see the release notes:
 > https://www.wireshark.org/docs/relnotes/wireshark-2.2.12.html

 > While we are at it, also add as hash for license file.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
