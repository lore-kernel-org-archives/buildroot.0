From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 20:48:32 +0200
Subject: [Buildroot] [PATCH] ulogd: only for kernels <= 3.16.x
In-Reply-To: <1412789575-31614-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 8 Oct 2014 14:32:55 -0300")
References: <1412789575-31614-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx3ebdof.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > The ulog netfilter target has been deprecated for some time and removed
 > in kernels >= 3.17.x so limit it to older headers. Fixes:
 > http://autobuild.buildroot.net/results/9ca/9ca43764c7363f9a00b8a0c7df20a492c00088b5/

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
