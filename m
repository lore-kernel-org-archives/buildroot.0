From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jan 2015 17:19:28 +0100
Subject: [Buildroot] [PATCH 1/2] benejson: fix for non-wchar toolchains
In-Reply-To: <1422281859-4003-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 26 Jan 2015 11:17:38 -0300")
References: <1422281859-4003-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ppa11pm7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > wchar needs to be disabled in order for it to build on !wchar. Fixes:
 > http://autobuild.buildroot.net/results/71f/71f19d5056b56d40463b9fef7fa859e0025c4991/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed both, thanks.

-- 
Bye, Peter Korsgaard
