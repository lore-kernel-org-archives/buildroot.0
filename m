From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 31 May 2014 09:40:36 +0200
Subject: [Buildroot] [PATCH v2] Improve tar check if bsdtar is installed
In-Reply-To: <1401487838-4010-1-git-send-email-abrahamh@web.de> (Heiko
 Abraham's message of "Sat, 31 May 2014 00:10:38 +0200")
References: <1401464676-2315-1-git-send-email-abrahamh@web.de>
 <1401487838-4010-1-git-send-email-abrahamh@web.de>
Message-ID: <87zjhy5rbf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Abraham <abrahamh@web.de> writes:

 > If bsdtar is installed, fix script error for tar version detection.
 > bsdtar not provide all expected command line (long) options
 > like "--hard-dereference". To ensure compatibly mark version
 > of tar as 'invalid' and trigger rebuild of 'host-tar'.

 > Signed-off-by: Heiko Abraham <abrahamh@web.de>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
