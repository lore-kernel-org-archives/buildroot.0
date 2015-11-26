From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Nov 2015 21:21:36 +0100
Subject: [Buildroot] [PATCH] libgsasl: fix auto dependencies
In-Reply-To: <1448560021-14096-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Nov 2015 14:47:01 -0300")
References: <1448560021-14096-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mg8wlyn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > IDN can be picked up from the distro installation so use a prefix when
 > it's available or otherwise just disable it, fixes:
 > http://autobuild.buildroot.org/results/5d9/5d9baf528c47c5167ec8d2a6941cb06b4ca761ca/

 > Also disable libgcrypt support which wasn't accounted for and doesn't
 > seem to work either to possibly avoid the same problem.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
