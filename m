From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Apr 2021 12:17:38 +0200
Subject: [Buildroot] [PATCH] package/nodejs: security bump to version
 12.22.1
In-Reply-To: <20210407071220.25669-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 7 Apr 2021 09:12:20 +0200")
References: <20210407071220.25669-1-peter@korsgaard.com>
Message-ID: <87czv6csal.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2020-7774: npm upgrade to 6.14.12 - Update y18n to fix
 > Prototype-Pollution (High)

 > This is a vulnerability in the y18n npm module which may be exploited by
 > prototype pollution.

 > https://github.com/advisories/GHSA-c4w7-xm78-47vh

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
