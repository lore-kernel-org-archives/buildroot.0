From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 02 Nov 2014 21:49:33 +0100
Subject: [Buildroot] [PATCH] libcap: Revert
	57280c2f244500ac6616377b3b8eab458c1ead23
In-Reply-To: <1414887377-5478-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Sat, 1 Nov 2014 21:16:17 -0300")
References: <1414887377-5478-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87h9yh5nvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Down bump libcap back to version 2.22 since 2.24 (and 2.23 as well) have
 > issues. But keep the switch back to kernel.org and update the hash.
 > Fixes:
 > http://autobuild.buildroot.net/results/2ef/2efb25356bc87ba0e1be08214eaa28ac064ad6c3/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

This is superseeded by your xattr patch, right?

-- 
Bye, Peter Korsgaard
