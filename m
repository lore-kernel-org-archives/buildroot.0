From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 19 Feb 2012 23:07:00 +0100
Subject: [Buildroot] [PATCH] [Lua] Avoid the warnings about the
	redefinition of LUA_USE_DLOPEN,
	when BR2_PACKAGE_LUA_INTERPRETER_READLINE is set.
In-Reply-To: <1329485943-8066-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Fri, 17 Feb 2012 10:39:03 -0300")
References: <1329485943-8066-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ty2m1nqz.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> From: Francois Perrad <francois.perrad@gadz.org>
 Gustavo> See in src/luaconf.h lines 36-40

Committed to next, thanks.

-- 
Bye, Peter Korsgaard
