From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 May 2016 22:48:09 +0200
Subject: [Buildroot] [PATCH] bind: security bump to version 9.10.4
In-Reply-To: <1462290124-6552-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 May 2016 12:42:04 -0300")
References: <1462290124-6552-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y47po8hi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-2088 - Duplicate EDNS COOKIE options in a response could
 > trigger an assertion failure.

 > Drop libressl support patch since it's upstream now.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
