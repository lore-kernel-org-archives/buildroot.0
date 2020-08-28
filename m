From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 19:03:46 +0200
Subject: [Buildroot] [PATCH] package/bind: security bump to version
 9.11.22
In-Reply-To: <20200821212612.9029-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 21 Aug 2020 23:26:12 +0200")
References: <20200821212612.9029-1-peter@korsgaard.com>
Message-ID: <878sdyr9cd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-8622: A truncated TSIG response can lead to an assertion failure
 > https://kb.isc.org/docs/cve-2020-8622

 > CVE-2020-8623: A flaw in native PKCS#11 code can lead to a remotely
 > triggerable assertion failure in pk11.c
 > https://kb.isc.org/docs/cve-2020-8623

 > CVE-2020-8624: update-policy rules of type "subdomain" are enforced incorrectly
 > https://kb.isc.org/docs/cve-2020-8624

 > For more details, see the release notes:
 > https://downloads.isc.org/isc/bind9/9.11.22/RELEASE-NOTES-bind-9.11.22.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
