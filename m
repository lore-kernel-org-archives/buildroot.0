From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Mar 2021 17:10:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.0
In-Reply-To: <20210301143700.253226-1-titouanchristophe@gmail.com> (Titouan
 Christophe's message of "Mon, 1 Mar 2021 15:37:00 +0100")
References: <20210301143700.253226-1-titouanchristophe@gmail.com>
Message-ID: <87wnuqq2go.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Titouan" == Titouan Christophe <titouanchristophe@gmail.com> writes:

 > This version also needs a patch from upstream to compile on musl systems.
 > From the release notes:
 > ================================================================================
 > Redis 6.2.0 GA  Released Tue Feb 22 14:00:00 IST 2021
 > ================================================================================

Why not upgrade to 6.0.11 instead? Given how close we are to 2021.02, I
would prefer to not move to a new major version.

-- 
Bye, Peter Korsgaard
