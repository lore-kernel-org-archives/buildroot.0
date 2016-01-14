From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Jan 2016 20:14:06 +0100
Subject: [Buildroot] [PATCH] openssh: security bump to version 7.1p2
In-Reply-To: <1452794143-13968-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 14 Jan 2016 14:55:43 -0300")
References: <1452794143-13968-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874meg0y9t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2016-0777 - Client Information leak from use of roaming connection
 > feature.

 > CVE-2016-0778 - A buffer overflow flaw was found in the way the OpenSSH
 > client roaming feature was implemented. A malicious server could
 > potentially use this flaw to execute arbitrary code on a successfully
 > authenticated OpenSSH client if that client used certain non-default
 > configuration options.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
