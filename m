From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Sep 2016 21:12:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/openssl: security bump to
	version 1.0.2i
In-Reply-To: <20160922171654.23121-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Thu, 22 Sep 2016 19:16:54 +0200")
References: <20160922171654.23121-1-bernd.kuhls@t-online.de>
Message-ID: <87r38boijw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > https://www.openssl.org/news/secadv/20160922.txt
 > Fixes
 > SSL_peek() hang on empty record (CVE-2016-6305)
 > SWEET32 Mitigation (CVE-2016-2183)
 > OOB write in MDC2_Update() (CVE-2016-6303)
 > Malformed SHA512 ticket DoS (CVE-2016-6302)
 > OOB write in BN_bn2dec() (CVE-2016-2182)
 > OOB read in TS_OBJ_print_bio() (CVE-2016-2180)
 > Pointer arithmetic undefined behaviour (CVE-2016-2177)
 > Constant time flag not preserved in DSA signing (CVE-2016-2178)
 > DTLS buffered message DoS (CVE-2016-2179)
 > DTLS replay protection DoS (CVE-2016-2181)
 > Certificate message OOB reads (CVE-2016-6306)
 > Excessive allocation of memory in tls_get_message_header()
 >   (CVE-2016-6307)
 > Excessive allocation of memory in dtls1_preprocess_fragment()
 >   (CVE-2016-6308)

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
