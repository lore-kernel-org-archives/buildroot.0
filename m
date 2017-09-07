From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 07 Sep 2017 11:19:09 +0200
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.6.0
In-Reply-To: <20170907081851.5x6mxczcydx7ut4t@tarshish> (Baruch Siach's
 message of "Thu, 7 Sep 2017 11:18:51 +0300")
References: <20170907081201.8397-1-peter@korsgaard.com>
 <20170907081851.5x6mxczcydx7ut4t@tarshish>
Message-ID: <87ingudfxu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Thu, Sep 07, 2017 at 10:12:01AM +0200, Peter Korsgaard wrote:
 >> Fixes CVE-2017-14032: Bypass of authentication of peer possible when the
 >> authentication mode is configured as 'optional'
 >> 
 >> For more details, see
 >> https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2017-02

 > Posted already: http://patchwork.ozlabs.org/patch/810255/.

Ups, I missed that - Sorry.

-- 
Bye, Peter Korsgaard
