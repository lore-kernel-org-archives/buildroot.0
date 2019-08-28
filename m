From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 17:16:59 +0200
Subject: [Buildroot] [PATCH 2/2] package/dovecot-pigeonhole: security
 bump version to 0.5.7.2
In-Reply-To: <20190828141315.4677-2-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 28 Aug 2019 16:13:15 +0200")
References: <20190828141315.4677-1-bernd.kuhls@t-online.de>
 <20190828141315.4677-2-bernd.kuhls@t-online.de>
Message-ID: <87blw9nwus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes:
 > https://dovecot.org/pipermail/dovecot/2019-August/116876.html

 > Fixes
 > * CVE-2019-11500: ManageSieve protocol parser does not properly handle
 >   NUL byte when scanning data in quoted strings, leading to out of
 >   bounds heap memory writes. Found by Nick Roessler and Rafi Rubin.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
