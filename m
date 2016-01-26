From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 26 Jan 2016 22:47:12 +0100
Subject: [Buildroot] [PATCH] bind: security bump to version 9.10.3-P3
In-Reply-To: <1453465691-24718-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 22 Jan 2016 09:28:11 -0300")
References: <1453465691-24718-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bn88qahr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-8704 - apl_42.c in ISC BIND 9.x before 9.9.8-P3 and 9.9.x and
 > 9.10.x before 9.10.3-P3 allows remote authenticated users to cause a
 > denial of service (INSIST assertion failure and daemon exit) via a
 > malformed Address Prefix List (APL) record.

 > CVE-2015-8705 - buffer.c in named in ISC BIND 9.10.x before 9.10.3-P3,
 > when debug logging is enabled, allows remote attackers to cause a denial
 > of service (REQUIRE assertion failure and daemon exit, or daemon crash)
 > or possibly have unspecified other impact via (1) OPT data or (2) an ECS
 > option.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
