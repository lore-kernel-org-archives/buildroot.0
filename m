From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 08:42:03 +0100
Subject: [Buildroot] [PATCH] package/xterm: security bump to version 366
In-Reply-To: <20210211180944.14218-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 11 Feb 2021 19:09:43 +0100")
References: <20210211180944.14218-1-peter@korsgaard.com>
Message-ID: <87czx5hgvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issue:
 > CVE-2021-27135: xterm through Patch #365 allows remote attackers to cause a
 > denial of service (segmentation fault) or possibly have unspecified other
 > impact via a crafted UTF-8 character sequence.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
