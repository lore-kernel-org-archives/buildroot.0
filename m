From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Jul 2014 21:52:03 +0200
Subject: [Buildroot] [PATCH] lxc: disable lua and python
In-Reply-To: <1404603241-20187-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 5 Jul 2014 20:34:01 -0300")
References: <1404603241-20187-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87oax22rks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Also conditionally disable bash if bash isn't built. Fixes:
 > http://autobuild.buildroot.net/results/8ea/8ea1d682706ba5fee27a64008bb7237d53120e9b/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

Any reason to not enable this support if lua/python is enabled?

-- 
Bye, Peter Korsgaard
