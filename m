From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 Aug 2014 22:19:39 +0200
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.10.9
In-Reply-To: <1407504594-3772-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 8 Aug 2014 10:29:54 -0300")
References: <1407504594-3772-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnruag4k.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > WNPA-SEC-2014-08 / CVE-2014-5161 / CVE-2014-5162
 > The Catapult DCT2000 and IrDA dissectors could underrun a buffer.

 > WNPA-SEC-2014-09 / CVE-2014-5163
 > The GSM Management dissector could crash.

 > WNPA-SEC-2014-10 / CVE-2014-5164
 > The RLC dissector could crash.

 > WNPA-SEC-2014-11 / CVE-2014-5165
 > The ASN.1 BER dissector could crash.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
