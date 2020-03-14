From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:22:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 4.10
In-Reply-To: <20200228231800.2384715-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 29 Feb 2020 00:18:00 +0100")
References: <20200228231800.2384715-1-fontaine.fabrice@gmail.com>
Message-ID: <87bloyvolh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop patch (already in version)
 > Update indentation of hash file (two spaces)

 > Fix the following issues:
 >  - CVE-2020-8517: Buffer Overflow issue in ext_lm_group_acl helper.
 >  - CVE-2019-12528: Information Disclosure issue in FTP Gateway.
 >  - CVE-2020-8449, CVE-2020-8450: Improper Input Validation issues in
 >    HTTP Request processing.
 >  - CVE-2019-18679: Information Disclosure issue in HTTP Digest
 >    Authentication.
 >  - CVE-2019-18678: HTTP Request Splitting issue in HTTP message
 >    processing.
 >  - CVE-2019-18677: Cross-Site Request Forgery issue in HTTP Request
 >    processing.
 >  - CVE-2019-12523, CVE-2019-18676: Multiple issues in URI processing.
 >  - CVE-2019-12526: Heap Overflow issue in URN processing.

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
