From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Dec 2014 23:48:52 +0100
Subject: [Buildroot] [PATCH] libnss: security bump to version 3.17.3
In-Reply-To: <1418728374-8002-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 16 Dec 2014 08:12:54 -0300")
References: <1418728374-8002-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87fvcfi52j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-1569 - The definite_length_decoder function in
 > lib/util/quickder.c in Mozilla Network Security Services (NSS) before
 > 3.16.2.4 and 3.17.x before 3.17.3 does not ensure that the DER encoding
 > of an ASN.1 length is properly formed, which allows remote attackers to
 > conduct data-smuggling attacks by using a long byte sequence for an
 > encoding.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
