From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 30 Jun 2014 23:30:13 +0200
Subject: [Buildroot] [PATCH] parted: fix nommu build
In-Reply-To: <1404134178-5667-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 30 Jun 2014 10:16:18 -0300")
References: <1404134178-5667-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mz2jday.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Add patch to accept uclinux in the tuple, and also disable dynamic libs
 > for static scenarios. Fixes:
 > http://autobuild.buildroot.net/results/d9a/d9a9baf0c1bfdb7f7d03ebed084a80ef3001c86d/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
