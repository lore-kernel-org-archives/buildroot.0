From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 12 May 2021 10:43:23 +0200
Subject: [Buildroot] [PATCH 2/2] boot/opensbi: unconditionally disable
 SSP
In-Reply-To: <20210508194155.3678473-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 8 May 2021 21:41:55 +0200")
References: <20210508194155.3678473-1-fontaine.fabrice@gmail.com>
 <20210508194155.3678473-2-fontaine.fabrice@gmail.com>
Message-ID: <878s4kl4us.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix build failure raised since commit
 > 810ba387bec3c5b6904e8893fb4cb6f9d3717466

 > Fixes:
 >  - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

I do notice that we apply our patches unconditionally, which isn't good
now that we support custom opensbi versions, so I've sent a series
fixing that:

https://patchwork.ozlabs.org/project/buildroot/list/?series=243398

-- 
Bye, Peter Korsgaard
