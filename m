From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Mar 2021 15:54:00 +0100
Subject: [Buildroot] [PATCH] package/python-aiohttp: security bump to
 version 3.7.4
In-Reply-To: <20210227123844.6652-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 27 Feb 2021 13:38:44 +0100")
References: <20210227123844.6652-1-peter@korsgaard.com>
Message-ID: <87tupf3y0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2021-21330: Open redirect vulnerability in aiohttp
 > (normalize_path_middleware middleware)

 > Beast Glatisant and Jelmer Vernooij reported that python-aiohttp, a async
 > HTTP client/server framework, is prone to an open redirect vulnerability.  A
 > maliciously crafted link to an aiohttp-based web-server could redirect the
 > browser to a different website.

 > For more details, see the advisory:
 > https://github.com/aio-libs/aiohttp/security/advisories/GHSA-v6wp-4m6f-gcjg

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
