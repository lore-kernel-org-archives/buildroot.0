From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 21:59:57 +0200
Subject: [Buildroot] [PATCH] strongswan: add upstream security patch
In-Reply-To: <20180930201215.21652-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 30 Sep 2018 22:12:15 +0200")
References: <20180930201215.21652-1-peter@korsgaard.com>
Message-ID: <87in2g17wi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2018-16151: The OID parser in the ASN.1 code in gmp allows any number of
 > random bytes after a valid OID.

 > CVE-2018-16152: The algorithmIdentifier parser in the ASN.1 code in gmp
 > doesn't enforce a NULL value for the optional parameter which is not used
 > with any PKCS#1 algorithm.

 > For more details, see the advisory:
 > https://www.strongswan.org/blog/2018/09/24/strongswan-vulnerability-(cve-2018-16151,-cve-2018-16152).html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, 2018.05.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
