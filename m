From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Aug 2018 23:15:42 +0200
Subject: [Buildroot] [PATCH] mbedtls: security bump to version 2.7.5
In-Reply-To: <20180824162715.21827-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 24 Aug 2018 18:27:15 +0200")
References: <20180824162715.21827-1-peter@korsgaard.com>
Message-ID: <878t4sbzi9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2018-0497: Remote plaintext recovery on use of CBC based ciphersuites
 >   through a timing side-channel

 > - CVE-2018-0498: Plaintext recovery on use of CBC based ciphersuites through
 >   a cache based side-channel

 > For more info, see the advisory:
 > https://tls.mbed.org/tech-updates/security-advisories/mbedtls-security-advisory-2018-02

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
