From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Nov 2018 00:12:34 +0100
Subject: [Buildroot] [PATCH] ruby: security bump to version 2.4.5
In-Reply-To: <20181030123755.13818-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 30 Oct 2018 13:37:55 +0100")
References: <20181030123755.13818-1-peter@korsgaard.com>
Message-ID: <874lckwp0d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2018-16396: Tainted flags are not propagated in Array#pack and
 >   String#unpack with some directives
 > https://www.ruby-lang.org/en/news/2018/10/17/not-propagated-taint-flag-in-some-formats-of-pack-cve-2018-16396/

 > - CVE-2018-16395: OpenSSL::X509::Name equality check does not work correctly
 > https://www.ruby-lang.org/en/news/2018/10/17/openssl-x509-name-equality-check-does-not-work-correctly-cve-2018-16395/

 > Update hash of LEGAL as it had a few (wayback machine) URLs added/changed.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
