From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Nov 2014 00:11:37 +0100
Subject: [Buildroot] [PATCH] pciutils: install to /usr/bin rather than
	/usr/sbin
In-Reply-To: <1417128671-27132-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 27 Nov 2014 19:51:11 -0300")
References: <1417128671-27132-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87y4qwme6u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Somehow busybox thinks debian standards are the rule and installs lspci
 > to /usr/bin instead of /usr/sbin where upstream says it belongs.
 > So install pciutils binaries there as well to really win over busybox
 > PATH-wise and overwrite the little bugger symlink.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
