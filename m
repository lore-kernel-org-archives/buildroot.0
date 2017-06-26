From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 10:00:34 +0200
Subject: [Buildroot] [PATCH] c-ares: security bump to version 1.13.0
In-Reply-To: <20170620212421.17455-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 20 Jun 2017 23:24:21 +0200")
References: <20170620212421.17455-1-peter@korsgaard.com>
Message-ID: <87a84vi3fh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-1000381: The c-ares function `ares_parse_naptr_reply()`, which is
 > used for parsing NAPTR responses, could be triggered to read memory outside
 > of the given input buffer if the passed in DNS response packet was crafted
 > in a particular way.

 > https://c-ares.haxx.se/adv_20170620.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
