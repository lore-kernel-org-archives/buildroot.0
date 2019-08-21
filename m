From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 08:43:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/squid: security bump to version
 4.8
In-Reply-To: <20190820201645.2941-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 20 Aug 2019 22:16:45 +0200")
References: <20190820201645.2941-1-fontaine.fabrice@gmail.com>
Message-ID: <87zhk3588d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Add a patch to fix cross-compilation
 > - Fix the following CVEs:
 >   - SQUID-2019:6 (CVE-2019-13345), Jul 12, 2019
 >     Fixed from 4.8
 >     Multiple Cross-Site Scripting issues in cachemgr.cgi
 >   - SQUID-2019:5 (CVE-2019-12527), Jul 12, 2019
 >     Fixed from 4.8
 >     Heap Overflow issue in HTTP Basic Authentication processing
 >   - SQUID-2019:3 (CVE-2019-12525), Jul 12, 2019
 >     Fixed from 4.8
 >     Denial of Service in HTTP Digest Authentication processing
 >   - SQUID-2019:2 (CVE-2019-12529), Jul 12, 2019
 >     Fixed from 4.8
 >     Denial of Service in HTTP Basic Authentication processing
 >   - SQUID-2019:1 (CVE-2019-12824), Jul 12, 2019
 >     Fixed from 4.8
 >     Denial of Service issue in cachemgr.cgi

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
