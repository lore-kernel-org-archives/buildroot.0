From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 26 Jun 2015 09:45:31 +0200
Subject: [Buildroot] [PATCH] heimdal: bump to version 1.6rc2
In-Reply-To: <1435252182-26100-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 25 Jun 2015 14:09:42 -0300")
References: <1435252182-26100-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87a8vm29r8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Helps drop some patches and hence autoreconf saving time.
 > Also allows parallel builds.

 > And fixes:
 > http://buildroot-busybox.2317881.n4.nabble.com/PATCH-v2-heimdal-explicitly-set-lpthread-td99422.html
 > without the need to hardcode libraries (disables/withouts weren't enough
 > though i've added them anyway for correctness).

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
