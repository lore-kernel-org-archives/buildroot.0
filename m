From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Mar 2016 22:36:47 +0200
Subject: [Buildroot] [PATCH] redis: use BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <1459174261-25242-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 28 Mar 2016 11:11:01 -0300")
References: <1459174261-25242-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87poue8hls.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It uses __atomic_fetch_add_4 so libatomic must be pulled in if
 > necessary. Fixes:
 > http://autobuild.buildroot.net/results/dfd/dfdfd77463b0ddd7016202372afcad7fb6fc9ce4/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
