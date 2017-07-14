From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 15:13:35 +0200
Subject: [Buildroot] [PATCH] nginx: security bump to version 1.12.1
In-Reply-To: <20170714090812.18154-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 14 Jul 2017 11:08:12 +0200")
References: <20170714090812.18154-1-peter@korsgaard.com>
Message-ID: <87bmonb1q8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2017-7529 - Nginx versions since 0.5.6 up to and including 1.13.2
 > are vulnerable to integer overflow vulnerability in nginx range filter
 > module resulting into leak of potentially sensitive information triggered by
 > specially crafted request.

 > For more details, see:
 > http://mailman.nginx.org/pipermail/nginx-announce/2017/000200.html

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
