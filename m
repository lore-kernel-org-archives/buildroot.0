From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 09:10:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.4
In-Reply-To: <20210617212459.11452-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Thu, 17 Jun 2021 23:24:59 +0200")
References: <20210617212459.11452-1-titouanchristophe@gmail.com>
Message-ID: <87wnql3vlg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > From the release notes:
 > ================================================================================
 > Redis 6.2.4 Released Tue July 1 12:00:00 IST 2021
 > ================================================================================

 > Upgrade urgency: SECURITY, Contains fixes to security issues that affect
 > authenticated client connections. MODERATE otherwise.
 > Fix integer overflow in STRALGO LCS (CVE-2021-32625)

 > Read the whole release note on:
 > https://github.com/redis/redis/blob/6.2.4/00-RELEASENOTES

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
