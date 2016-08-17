From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 15:03:22 +0200
Subject: [Buildroot] [PATCH] busybox: add upstream fixes for 1.25.0
In-Reply-To: <1471437710-8127-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 17 Aug 2016 09:41:50 -0300")
References: <1471437710-8127-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877fbfsg2t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add upstream patches to fix gzip (bug #9131 - incorrect compression
 > levels), ip (route add bug) and ntpd (CVE-2016-6301 - NTP server denial
 > of service).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
