From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 24 Sep 2014 22:56:52 +0200
Subject: [Buildroot] [PATCH] bash: security bump to patchlevel 25
In-Reply-To: <1411581682-9184-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 24 Sep 2014 15:01:22 -0300")
References: <1411581682-9184-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87egv03ffv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes CVE-2014-6271:
 > Under certain circumstances, bash will execute user code while
 > processing the environment for exported function definitions.

 > Also add hash file.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Yeah, pretty bad. Committed, thanks.

-- 
Bye, Peter Korsgaard
