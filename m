From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Jun 2021 15:08:29 +0200
Subject: [Buildroot] [PATCH] package/squid: security bump to version 4.15
In-Reply-To: <20210611100308.386-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 11 Jun 2021 12:03:08 +0200")
References: <20210611100308.386-1-peter@korsgaard.com>
Message-ID: <87fsxoft0y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-28651: Denial of Service in URN processing
 >   Due to a buffer management bug Squid is vulnerable to a Denial of service
 >   attack against the server it is operating on.

 >   This attack is limited to proxies which attempt to resolve a "urn:"
 >   resource identifier.  Support for this resolving is enabled by default in
 >   all Squid.

 >   https://github.com/squid-cache/squid/security/advisories/GHSA-ch36-9jhx-phm4

 > - CVE-2021-28652: Denial of Service issue in Cache Manager
 >   Due to an incorrect parser validation bug Squid is vulnerable to a Denial
 >   of Service attack against the Cache Manager API.

 >   https://github.com/squid-cache/squid/security/advisories/GHSA-m47m-9hvw-7447

 > - CVE-2021-28662: Denial of Service in HTTP Response Processing
 >   Due to an input validation bug Squid is vulnerable to a Denial of Service
 >   against all clients using the proxy.

 >   https://github.com/squid-cache/squid/security/advisories/GHSA-jjq6-mh2h-g39h

 > - CVE-2021-31806, CVE-2021-31807, CVE-2021-31808: Multiple Issues in HTTP
 >   Range header
 >   Due to an incorrect input validation bug Squid is vulnerable to
 >   a Denial of Service attack against all clients using the proxy.

 >   https://github.com/squid-cache/squid/security/advisories/GHSA-pxwq-f3qr-w2xf

 > - CVE-2021-33620: Denial of Service in HTTP Response processing
 >   Due to an input validation bug Squid is vulnerable to a Denial of Service
 >   against all clients using the proxy.

 >   https://github.com/squid-cache/squid/security/advisories/GHSA-572g-rvwr-6c7f

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
