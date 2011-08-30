From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 30 Aug 2011 14:23:24 +0200
Subject: [Buildroot] [PATCH] ipset: fixup kernel checks
In-Reply-To: <1313609257-25479-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 17 Aug 2011 16:27:37 -0300")
References: <1313609257-25479-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87liubnl4z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Add patch to kill kernel checks since we don't build the modules for
 Gustavo> older kernel versions anyway.

Committed with a slightly tweaked commit message, thanks.

-- 
Bye, Peter Korsgaard
