From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 17 Sep 2013 23:07:45 +0200
Subject: [Buildroot] [PATCH] apply-patches.sh: avoid reversed/already
	applied patches
In-Reply-To: <1379443553-12452-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 17 Sep 2013 15:45:53 -0300")
References: <1379443553-12452-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <871u4ndun2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Disable reversed/already applied patches fallout from commit
 Gustavo> 5871b791995ebe295db7dca608afe3f293ce8953
 Gustavo> Reverse patches are bad, they may unfix things with version bumps and
 Gustavo> just sneak under the radar with pure batch mode.

Committed, thanks.

-- 
Bye, Peter Korsgaard
