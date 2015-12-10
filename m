From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Dec 2015 21:51:15 +0100
Subject: [Buildroot] [PATCH] atk: drop ATK_CONF_ENV variables
In-Reply-To: <1449755844-1146-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 10 Dec 2015 10:57:24 -0300")
References: <1449755844-1146-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k2omjad8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > These are completely historic from the initial commit (810184bb) and
 > completely unused.

 > Two separate builds with/without give nothing with:

 > $ diff -u atk.cv/config.log atk-2.18.0/config.log|grep ^+

 > And all removals with:

 > $ diff -u atk.cv/config.log atk-2.18.0/config.log|grep ^-

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
