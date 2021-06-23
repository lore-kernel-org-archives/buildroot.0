From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 23 Jun 2021 09:07:46 +0200
Subject: [Buildroot] [PATCH for 2021.02.x 1/1] package/redis: security
 bump to v6.0.14
In-Reply-To: <20210617213608.30066-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Thu, 17 Jun 2021 23:36:08 +0200")
References: <20210617213608.30066-1-titouanchristophe@gmail.com>
Message-ID: <871r8t5a9p.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > From the release notes:
 > ================================================================================
 > Redis 6.0.14 Released Tue July 1 12:00:00 IST 2021
 > ================================================================================

 > Upgrade urgency: SECURITY, Contains fixes to security issues that affect
 > authenticated client connections. MODERATE otherwise.

 > Fix integer overflow in STRALGO LCS (CVE-2021-32625)

 > Read the full release notes on:
 > https://github.com/redis/redis/blob/6.0.14/00-RELEASENOTES

 > Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
